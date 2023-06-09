
hardhat环境搭建：
```
yarn add --dev hardhat // 初始化项目
yarn hardhat

yarn add solhint // solidity lint
yarn solhint contracts/*.sol

yarn add --dev @chainlink/contracts

yarn add --dev hardhat-deploy
yarn add --dev @nomiclabs/hardhat-ethers@npm:hardhat-deploy-ethers ethers
yarn hardhat deploy

yarn hardhat deploy --tags mocks // mock contract

yarn hardhat node // 启动一个本地环境, 窗口保持
yarn hardhat deploy // mock + deploy
yarn hardhat run scripts/deploy.js  --network spolia // 测试环境 + verify
```