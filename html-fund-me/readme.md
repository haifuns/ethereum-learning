- [ethers doc](https://docs.ethers.org/v5/)
- [metamask doc](https://docs.metamask.io/wallet/reference/rpc-api/)


```
cd hardhat-fund-me
yarn hardhat node // 启动本地环境，得到环境地址和账户配置到metamask，单独terminal
yarn hardhat deploy --network localhost // 部署合约，得到FundMe合约地址，填到constants.js

cd html-fund-me
yarn // 安装依赖
yarn http-server // 启动http服务，或者使用Live Server插件
```