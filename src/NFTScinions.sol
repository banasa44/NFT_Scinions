// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

/**
 * @title NFTScinions
 * @dev A simple ERC-721 contract with minting, metadata, and transfer functionality.
 */
contract NFTScinions is ERC721, Ownable {
    using Strings for uint256;

    uint256 private _nextTokenId; // Tracks the next token ID to be minted
    string private _baseTokenURI; // Base URI for metadata

    mapping(uint256 => string) private _tokenMetadata; // Maps token ID to metadata URI
    mapping(uint256 => uint256) private _tokenLevels;

    constructor(string memory baseURI) ERC721("NFTScinions", "SCN") Ownable(msg.sender) {
        _baseTokenURI = baseURI;
        _nextTokenId = 1; // Start token IDs at 1
    }

    function mint(address to) external onlyOwner {
        uint256 tokenId = _nextTokenId;
        _nextTokenId++;

        _mint(to, tokenId);

        // Initialize the level of the token to 1
        _tokenLevels[tokenId] = 1;
    }

    /**
     * @notice Retrieve the metadata URI for a specific token.
     * @param tokenId The ID of the token to query.
     * @return The metadata URI of the token.
     */
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_ownerOf(tokenId) != address(0), "Nonexistent token");
        // Append tokenId to the base URI to form the full URI
        return string(abi.encodePacked(_baseTokenURI, "char", tokenId.toString(), ".json"));
    }

    /// @notice Updates the base URI (if you re-upload to IPFS)
    /// @param baseURI The new base URI
    function setBaseURI(string memory baseURI) external onlyOwner {
        _baseTokenURI = baseURI;
    }

    /// @notice Returns the current base URI
    /// @return The base URI
    function getBaseURI() external view returns (string memory) {
        return _baseTokenURI;
    }

    /// @notice Gets the current level of a token
    /// @param tokenId The token ID
    /// @return The current level of the token
    function getLevel(uint256 tokenId) external view returns (uint256) {
        require(_ownerOf(tokenId) != address(0), "Nonexistent token");
        return _tokenLevels[tokenId];
    }

    /// @notice Increases the level of a token by 1
    /// @param tokenId The token ID
    function levelUp(uint256 tokenId) external onlyOwner {
        require(_ownerOf(tokenId) != address(0), "Nonexistent token");
        _tokenLevels[tokenId] += 1;
    }

    /// @notice Sets the level of a token to a specific value (onlyOwner)
    /// @param tokenId The token ID
    /// @param newLevel The new level for the token
    function setLevel(uint256 tokenId, uint256 newLevel) external onlyOwner {
        require(_ownerOf(tokenId) != address(0), "Nonexistent token");
        _tokenLevels[tokenId] = newLevel;
    }
}
