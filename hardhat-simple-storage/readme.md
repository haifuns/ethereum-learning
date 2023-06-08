- [solcjs Solidity编译器](https://github.com/ethereum/solc-js)
- [hardhat 以太坊开发环境](https://hardhat.org/)
- [ganache 本地虚拟区块链](https://trufflesuite.com/ganache/)
- [ethers.js 区块链工具包](https://ethers.org/)
- [web3.js 区块链工具包](https://docs.web3js.org/)
- [ethervm Solidity反编译](https://ethervm.io/decompile)
- [alchemy 连接测试网/主网](https://www.alchemy.com/)
- [etherscan 区块链浏览器，连接到sepolia测试网](https://sepolia.etherscan.io/)


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
```