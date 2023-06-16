```
forge init
forge install smartcontractkit/chainlink-brownie-contracts@0.6.1 --no-commit

forge test --fork-url $SEPOLIA_RPC_URL
forage coverage
```