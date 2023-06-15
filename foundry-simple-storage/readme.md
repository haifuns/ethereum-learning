- [foundry 开发框架](https://book.getfoundry.sh/)


foundry环境搭建：
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
```