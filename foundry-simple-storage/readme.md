- [foundry 开发框架](https://book.getfoundry.sh/)
- [thirdweb 三方网络部署](https://thirdweb.com/)
- [alchemy 连接测试网/主网](https://www.alchemy.com/)

foundry 环境搭建：

```sh
curl -L https://foundry.paradigm.xyz | bash // 安装foundryup
source ~/.zshenv
foundryup // 安装foundry工具链

forge --version
cast --version
anvil --version // anvil是内置的本地环境
chisel --version

forge init // 初始化项目

forge compile // 编译
anvil // 启动本地环境，单独terminal

forge create SimpleStorage --rpc-url http://127.0.0.1:7545 --interactive // 手动部署合约

forge script script/DeploySimpleStorage.s.sol // 脚本部署
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private-key xxx // 在本地anvil环境部署

// 使用.env
source .env
$PRIVATE_KEY

forge script script/DeploySimpleStorage.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY
forge script script/DeploySimpleStorage.s.sol --rpc-url $SEPOLIA_RPC_URL --broadcast --private-key $PRIVATE_KEY // 部署到sepolia测试网

// cast工具包
cast send 0xe7f1725e7734ce288f8367e1bb143e90bb3f0512 "store(uint256)" 123 --rpc-url $RPC_URL --private-key $PRIVATE_KEY // 发送交易
cast call 0xe7f1725e7734ce288f8367e1bb143e90bb3f0512 "retrieve" --rpc-url $RPC_URL --private-key $PRIVATE_KEY // 调用合约
cast --to-base 0x000000000000000000000000000000000000000000000000000000000000007b dec // 16进制转10进制
```
