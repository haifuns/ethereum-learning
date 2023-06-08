
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
```