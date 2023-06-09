// function deployFunc(hre) {
//     console.log("Hi")
// }
// yarn hardhat deploy 调用默认函数
// module.exports.default = deployFunc

const { network } = require("hardhat")
const { networkConfig } = require("../helper-hardhat-config")

// hre.getNameAccounts
// hre.deployments
module.exports = async ({ getNameAccounts, deployments }) => {
    const { deploy, log } = deployments
    // hardhat.config.js配置
    const { deployer } = await getNamedAccounts()
    const chainId = network.config.chainId

    const ethUsdPriceFeedAddress = networkConfig[chainId]["ethUsdPriceFeed"]
    const fundMe = deploy("FundMe", {
        from: deployer,
        args: [ethUsdPriceFeedAddress],
        log: true,
    })
}
