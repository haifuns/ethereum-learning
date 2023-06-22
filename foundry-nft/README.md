- [ERC-721 NFTs](https://ethereum.org/zh/developers/docs/standards/tokens/erc-721/)
- [IPFS 分布式去中心化数据存储，类区块链](https://ipfs.tech/)
- [pinata.cloud IPFS上的去中心化存储](https://www.pinata.cloud/)
- [arweave.org 去中心化存储](https://arweave.org/)
- [filecoin.io 去中心化存储](https://filecoin.io/)
- [nft.storage IPFS和Filecoin上的去中心化存储](https://nft.storage/)
- [joinfire 资产安全-交易前检查交易细节](https://www.joinfire.xyz/)


存储方式：SVG ipfs https

```sh
make deploy ARGS="--network sepolia" # 部署basic nft到测试网络
make mintBasicNft ARGS="--network sepolia" # 在测试网络铸造basic nft, 执行失败可能是需要安装jq, 见foundry-devops仓库


base64 -i example.svg # 转换为base64编码
# 浏览器预览
# data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCI+Cjx0ZXh0IHg9IjAiIHk9IjE1IiBmaWxsPSJibGFjayI+SGkhIFlvdXIgYnJvd3NlciBkZWNvZGVkIHRoaXM8L3RleHQ+Cjwvc3ZnPg==

forge test
forge test --fork-url $SEPOLIA_RPC_URL 
forge coverage

make deployMood ARGS="--network sepolia" # 部署mood nft到测试网络
make mintMoodNft ARGS="--network sepolia" # 铸造mood nft
make flipMoodNft ARGS="--network sepolia" # 转换mood nft
```

如果铸造失败很有可能是因为需要安装jq（foundry-devops依赖）：
- https://github.com/Cyfrin/foundry-full-course-f23/discussions/58
- https://jqlang.github.io/jq/