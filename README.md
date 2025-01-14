## **NFT Scinions**

This is a sample project for Scinions, built to showcase a simple ERC-721 smart contract implementation. It allows minting, transferring, and managing unique game character NFTs. Each NFT includes metadata and attributes such as levels, making it suitable for dynamic game interactions.

This project is built using Foundry, a blazing-fast and developer-friendly framework for Ethereum smart contract development. Foundry was chosen for its simplicity in deployment, testing, and efficient development workflows.

---

## **Requirements**

To get started, ensure you have the following installed on your machine:

1. Foundry: For building, testing, and deploying the smart contracts.
2. Node.js and npm/yarn: If you need additional tooling like pinning metadata to IPFS.
3. Git: To manage the project repository.

---

## **Installation**

### **Install Foundry**

1. Install Foundry by running:
   ```shell
   curl -L https://foundry.paradigm.xyz | bash
   foundryup
   ```
   This installs Foundry and keeps it updated.
2. Verify installation:

   ```shell
   forge --version
   ```

---

### **Clone the Repository**

1. Clone this repository
   ```shell
   git clone https://github.com/banasa44/NFT_Scinions.git
   cd NFT_Scinions
   ```
2. Install dependencies (e.g., OpenZeppelin contracts):
   ```shell
   forge install
   ```

---

## Usage

### Build

To compile the smart contracts:

```shell
$ forge build
```

---

### Test

To run the tests and verify the functionality:

```shell
$ forge test
```

---

### Deploy

1. Set your `.env` file with the following variables:

```env
PRIVATE_KEY=<your_private_key>
RPC_URL=<your_rpc_url>

```

2. Deploy the contract using the deployment script:

```shell
forge script script/DeployNFTScinions.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
```

3. Verify the deployment output for the deployed contract address.

---

### **Additional Commands**

#### **Interact with the Contract**

Use Foundry’s `cast` command to interact with the deployed contract. For example:

- **Mint an NFT**:
  ```shell
  cast send <contract_address> "mint(address)" <recipient_address> --rpc-url $RPC_URL --private-key $PRIVATE_KEY
  ```
- **Check Metadata URI**:
  ```shell
  cast call <contract_address> "tokenURI(uint256)" 1 --rpc-url $RPC_URL
  ```

---

## Smart Contract Explanation

### Sepolia - Etherscan

You can find the verified Smart Contract on [Etherscan - NFTScinions](https://sepolia.etherscan.io/address/0xac8fa49ae128da9a63c494c3056de4c3a528466a) (0xac8fa49ae128da9a63c494c3056de4c3a528466a)

### Usage

- The `mint` function is restricted to the deployer of the contract. This design assumes the deployer will act as the company, managing the creation of characters for players. Characters can be minted to any address by the deployer.
- NFTs can be transferred freely between addresses.
- Only the owner of the Smart Contract can upgrade the `level` of an NFT. However, anyone can read the level using the `getLevel` function.
- The metadata URI, which contains the NFT's information and image, can be retrieved using the `tokenURI` function.
- The JSON Metadata follows the standards so it can be seen in common marketplaces.

Once minted, the NFT can be viewed on marketplaces such as OpenSea:

[OpenSea - NFTScinions collection](https://testnets.opensea.io/collection/nftscinions).

### Improvements & Suggestions

- **Metadata Flexibility**:  
  This implementation uses the Pinata IPFS service to host JSON metadata and NFT images. The base URI approach appends incremental token IDs to mint consecutive NFTs (e.g., `char1`, `char2`, etc.). However, this setup is rigid as it does not allow metadata URIs to be updated after deployment.  
  While simple, a more flexible implementation could permit metadata URI updates. However, this could compromise the trustless nature of the system, as changing metadata might break users' trust.

- **Character Levels**:  
  This implementation registers levels for each NFT. These levels won't be visible on marketplaces but are stored on-chain. This approach ensures simplicity and immutability for the metadata uploaded to IPFS. Despite its simplicity, this is sufficient for in-game level functionality.

- **Dynamic Traits for Marketplaces**:  
  To add levels or other attributes directly to the metadata and display them dynamically on marketplaces (e.g., OpenSea), more complex setups could be explored. For more details, see OpenSea's documentation on [Dynamic Traits](https://docs.opensea.io/docs/dynamic-traits).

- **Exploring ERC-6551 (Token-Bound Accounts)**:  
  A more advanced system could leverage Token-Bound Accounts (EIP-6551). This standard enables each NFT to act as its own wallet, opening up possibilities for decentralized game logic and composability. Learn more: [Ethereum ERC-6551](https://eips.ethereum.org/EIPS/eip-6551)
