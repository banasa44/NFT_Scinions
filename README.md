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
