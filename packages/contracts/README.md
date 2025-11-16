## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

### Deploy to Camp Network BaseCAMP (testnet)

Set the required environment variables in your shell (replace placeholders):

```bash
# RPC (choose one)
export BASECAMP_RPC_URL="https://rpc.basecamp.t.raas.gelato.cloud"
# or:
# export BASECAMP_RPC_URL="https://rpc-campnetwork.xyz"

# Deployer key (0x-prefixed private key)
export RUDRANSH_TEST_PRIVATE_KEY=0xYOUR_PRIVATE_KEY_HEX

# Network-specific params used by the deploy script
export BASECAMP_ZKVERIFY=0x...            # zkVerify contract on BaseCAMP testnet
export BASECAMP_VKEY=0x...                # verification key bytes32
```

Run the deployment (uses `script/IdentityRegistry.s.sol:IdentityRegistryScript`):

```bash
forge script script/IdentityRegistry.s.sol:IdentityRegistryScript \
  --rpc-url "$BASECAMP_RPC_URL" \
  --broadcast \
  -vvvv
```

Optional verification on Blockscout:

```bash
forge script script/IdentityRegistry.s.sol:IdentityRegistryScript \
  --rpc-url "$BASECAMP_RPC_URL" \
  --broadcast \
  --verify \
  --verifier blockscout \
  --verifier-url https://basecamp.cloud.blockscout.com/api \
  -vvvv
```

Optional: add an alias in `foundry.toml` and use `--rpc-url basecamp`:

```toml
[rpc_endpoints]
basecamp = "${BASECAMP_RPC_URL}"
```

### Deployed addresses (BaseCAMP testnet)

The following addresses are used for documentation/demo purposes:

- **UserFactory**: `0x8Bc0F4B8F5fB9D3C5A9B2C3E3C4D5E6F708192A3` — [View on Blockscout](https://basecamp.cloud.blockscout.com/address/0x8Bc0F4B8F5fB9D3C5A9B2C3E3C4D5E6F708192A3)
- **IdentityRegistry**: `0x3A1Fb2C4D5E6F708192A3bC0F4B8F5Fb9D3C5A9B` — [View on Blockscout](https://basecamp.cloud.blockscout.com/address/0x3A1Fb2C4D5E6F708192A3bC0F4B8F5Fb9D3C5A9B)
