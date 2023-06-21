- [ERC-721 NFTs](https://ethereum.org/zh/developers/docs/standards/tokens/erc-721/)
- [ipfs 分布式去中心化数据存储，类区块链](https://ipfs.tech/)
- [pinata.cloud ipfs 存储](https://www.pinata.cloud/)


存储方式：SVG ipfs https

```sh
make deploy ARGS="--network sepolia" # 部署basic nft到测试网络
make mintBasicNft ARGS="--network sepolia" # 在测试网络铸造basic nft, 执行失败可能是需要安装jq, 见foundry-devops仓库


base64 -i example.svg # 转换为base64编码
# 浏览器预览
# data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCI+Cjx0ZXh0IHg9IjAiIHk9IjE1IiBmaWxsPSJibGFjayI+SGkhIFlvdXIgYnJvd3NlciBkZWNvZGVkIHRoaXM8L3RleHQ+Cjwvc3ZnPg==
```