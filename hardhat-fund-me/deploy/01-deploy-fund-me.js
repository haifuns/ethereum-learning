// function deployFunc(hre) {
//     console.log("Hi")
// }
// yarn hardhat deploy 调用默认函数
// module.exports.default = deployFunc

const { network } = require("hardhat")
const { networkConfig, developmentChains } = require("../helper-hardhat-config")

// hre.getNameAccounts
// hre.deployments
module.exports = async ({ getNameAccounts, deployments }) => {
    const { deploy, log } = deployments
    // hardhat.config.js配置
    const { deployer } = await getNamedAccounts()
    const chainId = network.config.chainId

    let ethUsdPriceFeedAddress
    if (developmentChains.includes(network.name)) {
        const ethUsdAggregator = await deployments.get("MockV3Aggregator")
        ethUsdPriceFeedAddress = ethUsdAggregator.address
    } else {
        ethUsdPriceFeedAddress = networkConfig[chainId]["ethUsdPriceFeed"]
    }

    const fundMe = await deploy("FundMe", {
        from: deployer,
        args: [ethUsdPriceFeedAddress],
        log: true,
    })

    log("---------------------------------------")
}

module.exports.tags = ["all", "fundme"]