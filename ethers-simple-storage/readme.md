- [solcjs Solidity编译器](https://github.com/ethereum/solc-js)
- [hardhat 以太坊开发环境](https://hardhat.org/)
- [ganache 本地虚拟区块链](https://trufflesuite.com/ganache/)
- [ethers.js 区块链工具包](https://ethers.org/)
- [web3.js 区块链工具包](https://docs.web3js.org/)
- [ethervm Solidity反编译](https://ethervm.io/decompile)


本地环境搭建：
```
npm i -g corepack
corepack enable // enable yarn

// yarn 镜像
npm install -g yrm
yrm ls
yrm use taobao
yrm test taobao

yarn add solc
yarn add ethers

yarn add fs-extra // 文件操作工具包

node deploy.js
``` 

环境变量：
```
yarn add dotenv
```

私钥管理：
```
// 删除.env中的PRIVATE_*环境变量
// 生成密钥
node encryptkey.js PRIVATE_KEY=0x000 PRIVATE_KEY_PASSWORD=password
// 使用密钥登录钱包，连接钱包方式从PRIVATE_KEY改为密钥+PRIVATE_KEY_PASSWORD
node deploy.js PRIVATE_KEY_PASSWORD=password
```

代码格式（VSCode Plugin：Prettier - Code formatter）：
```
yarn add prettier prettier-plugin-solidity // https://github.com/prettier-solidity/prettier-plugin-solidity
```