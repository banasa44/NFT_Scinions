// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import "../src/NFTScinions.sol";

contract NFTScinionsTest is Test {
    NFTScinions private nftScinions;

    // Define the deployer (owner) and user addresses
    address private owner = 0x60C7A23B85903EE6B5598e2800865E0AC35d94f9;
    address private user = 0x99DFADCD62593325BcF82ED1f55d87840E93a966;

    function setUp() public {
        // Start as the owner for the deployment
        vm.startPrank(owner);

        // Deploy the contract with the base URI
        nftScinions = new NFTScinions(
            "https://azure-official-primate-239.mypinata.cloud/ipfs/bafybeig2yu3ubbmmmkedtsurlyn4ihbm3wq5hkhujcl72vwrj5zr3xzaxa/"
        );

        // Stop impersonating the owner
        vm.stopPrank();
    }

    function testMintAndTransfer() public {
        // Start impersonating the owner
        vm.startPrank(owner);

        // Mint the first NFT to the owner
        nftScinions.mint(owner);

        // Assert that the token exists and is owned by the owner
        assertEq(nftScinions.ownerOf(1), owner);
        assertEq(nftScinions.getLevel(1), 1); // Level should start at 1

        // Transfer the NFT to the user
        nftScinions.safeTransferFrom(owner, user, 1);

        // Assert that the user is now the owner of the NFT
        assertEq(nftScinions.ownerOf(1), user);

        // Mint the second NFT to the user
        nftScinions.mint(user);

        // Assert that the token exists and is owned by the user
        assertEq(nftScinions.ownerOf(2), user);

        // Stop impersonating the owner
        vm.stopPrank();
    }

    function testLevelUp() public {
        // Start impersonating the owner
        vm.startPrank(owner);

        // Mint the first NFT to the owner
        nftScinions.mint(owner);

        // Level up the token
        nftScinions.levelUp(1);

        // Assert the level has been increased
        assertEq(nftScinions.getLevel(1), 2);

        // Stop impersonating the owner
        vm.stopPrank();
    }

    function testSetAndGetLevel() public {
        // Start impersonating the owner
        vm.startPrank(owner);

        // Mint the first NFT to the owner
        nftScinions.mint(owner);

        // Set the token level to 10
        nftScinions.setLevel(1, 10);

        // Assert the level has been updated correctly
        assertEq(nftScinions.getLevel(1), 10);

        // Stop impersonating the owner
        vm.stopPrank();
    }

    function testRetrieveMetadata() public {
        // Start impersonating the owner
        vm.startPrank(owner);

        // Mint the first NFT to the owner
        nftScinions.mint(owner);
        nftScinions.mint(owner);

        // Retrieve the token URI for tokenId 1
        string memory tokenURI1 = nftScinions.tokenURI(1);

        // Expected metadata URI (base URI + "char1.json")
        string memory expectedURI1 =
            "https://azure-official-primate-239.mypinata.cloud/ipfs/bafybeig2yu3ubbmmmkedtsurlyn4ihbm3wq5hkhujcl72vwrj5zr3xzaxa/char1.json";

        // Retrieve the token URI for tokenId 1
        string memory tokenURI2 = nftScinions.tokenURI(2);

        // Expected metadata URI (base URI + "char1.json")
        string memory expectedURI2 =
            "https://azure-official-primate-239.mypinata.cloud/ipfs/bafybeig2yu3ubbmmmkedtsurlyn4ihbm3wq5hkhujcl72vwrj5zr3xzaxa/char2.json";

        // Assert that the token URI matches the expected value
        assertEq(tokenURI1, expectedURI1);
        assertEq(tokenURI2, expectedURI2);

        // Stop impersonating the owner
        vm.stopPrank();
    }
}
