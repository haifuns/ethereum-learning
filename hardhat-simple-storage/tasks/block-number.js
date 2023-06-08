const { task } = require("hardhat/config")

// 自定义task
// hardhat.org/hardhat-runner/docs/advanced/create-task
https: task("block-number", "Prints the current block number").setAction(
    // 匿名函数，等价于
    // const block = async function() => {}
    // async function blockTask() {}
    async (taskArgs, hre) => {
        const blockNumber = await hre.ethers.provider.getBlockNumber()
        console.log(`Current number is ${blockNumber}`)
    }
)
