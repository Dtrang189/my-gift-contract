# My Gift Contract

A comprehensive Cardano smart contract project for gifting ADA, built with [Aiken](https://aiken-lang.org/) and [MeshSDK](https://meshjs.dev/).

## Project Structure

- `validators/`: Contains the Aiken smart contract code (`gift.ak`).
- `lib/`: Supporting Aiken functions.
- `scripts/`: Off-chain interaction scripts (Typescript/MeshSDK).
- `plutus.json`: Compiled smart contract blueprint (generated).

## Prerequisites

- [Aiken](https://github.com/aiken-lang/aiken) installed.
- Javascript runtime (Node.js 18+).
- `npm` installed.

## Setup

1.  **Install Dependencies**:

    ```bash
    npm install
    ```

2.  **Environment Variables**:
    Create a `.env` file in the root directory (copied from `.env.example` if available) and add your mnemonic:
    ```env
    MNEMONIC="your 24 word mnemonic here ..."
    ```

## Development Workflow

### 1. Compile Smart Contract

Compile the Aiken code to generate the `plutus.json` blueprint.

```bash
aiken build
```

### 2. Run Tests

Execute unit tests defined in `validators/gift.ak`.

```bash
aiken check
```

### 3. Off-chain Interaction

Run the off-chain script to interact with the contract (e.g., get contract address).

```bash
npm start
```

## Documentation

- [Aiken Documentation](https://aiken-lang.org)
- [MeshSDK Documentation](https://meshjs.dev)
