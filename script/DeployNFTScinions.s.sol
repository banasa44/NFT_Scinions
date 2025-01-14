// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "../src/NFTScinions.sol";

contract DeployNFTScinions is Script {
    function run() external {
        // Start broadcasting transactions
        vm.startBroadcast();

        // Set the base URI
        string memory baseURI =
            "https://azure-official-primate-239.mypinata.cloud/ipfs/bafybeig2yu3ubbmmmkedtsurlyn4ihbm3wq5hkhujcl72vwrj5zr3xzaxa/";

        // Deploy the NFTScinions contract
        NFTScinions nftScinions = new NFTScinions(baseURI);

        // Log the contract address to the console
        console.log("NFTScinions deployed to:", address(nftScinions));

        // Stop broadcasting
        vm.stopBroadcast();
    }
}
