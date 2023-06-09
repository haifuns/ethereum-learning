- [solcjs Solidity编译器](https://github.com/ethereum/solc-js)
- [hardhat 以太坊开发环境](https://hardhat.org/)
- [ganache 本地虚拟区块链](https://trufflesuite.com/ganache/)
- [ethers.js 区块链工具包](https://ethers.org/)
- [web3.js 区块链工具包](https://docs.web3js.org/)
- [ethervm Solidity反编译](https://ethervm.io/decompile)
- [alchemy 连接测试网/主网](https://www.alchemy.com/)
- [etherscan 区块链浏览器，连接到sepolia测试网](https://sepolia.etherscan.io/)
- [rekt.news 黑客攻击事件](https://rekt.news/leaderboard/)
- [mochajs JavaScript测试框架](https://mochajs.org/)
- [coinmarketcap 加密货币价格](https://coinmarketcap.com/)


hardhat框架环境搭建：
```
yarn init
yarn add --dev hardhat
yarn hardhat // 初始化项目
yarn hardhat compile
yarn hardhat run scripts/deploy.js  // hardhat 内置 Hardhat Network
//yarn hardhat run scripts/deploy.js  --network hardhat

yarn add --dev dotenv // .env

yarn hardhat run scripts/deploy.js  --network spolia // 切换测试网络到 alchemy & spolia

yarn add --dev @nomiclabs/hardhat-etherscan // 验证合约

yarn hardhat block-number --network spolia // 测试自定义hardhat task

yarn hardhat node // 启动hardhat本地节点 http://127.0.0.1:8545/
yarn hardhat run scripts/deploy.js  --network localhost // 从本地环境启动

yarn hardhat console --network localhost // hardhat 控制台

yarn hardhat test // 运行测试

yarn add hardhat-gas-reporter --dev // 安装hardhat gas 报告插件

yarn add --dev solidity-coverage // 测试覆盖率插件
yarn hardhat coverage
```