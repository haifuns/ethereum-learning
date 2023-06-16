```sh
forge --version # forge是命令行工具，用来测试、构建和部署您的智能合约
cast --version # cast是执行以太坊RPC调用的命令行工具
anvil --version # anvil是内置的本地环境
chisel --version # chisel用来快速测试Solidity片段

forge init
forge install smartcontractkit/chainlink-brownie-contracts@0.6.1 --no-commit

forge test --fork-url $SEPOLIA_RPC_URL # 执行测试，-vvv用来打印运行日志

forge coverage # 生成测试覆盖率报告

forge snapshot # 为测试函数生成 Gas 快照

forge install ChainAccelOrg/foundry-devops --no-commit

make test # 使用make命令, 见Makefile
```