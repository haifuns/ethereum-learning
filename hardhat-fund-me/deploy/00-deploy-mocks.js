const { network } = require("hardhat")
const {
    developmentChains,
    DECIMALS,
    INITIAL_ANSWER,
} = require("../helper-hardhat-config")

// hre.getNameAccounts
// hre.deployments
module.exports = async ({ getNameAccounts, deployments }) => {
    const { deploy, log } = deployments
    // hardhat.config.js配置
    const { deployer } = await getNamedAccounts()

    // 本地环境 mock
    if (developmentChains.includes(network.name)) {
        log("Local network detected! Deploying mocks...")
        await deploy("MockV3Aggregator", {
            contract: "MockV3Aggregator",
            from: deployer,
            log: true,
            args: [DECIMALS, INITIAL_ANSWER],
        })
        log("Mocks deployed!")
        log("---------------------------------------")
    }
}

module.exports.tags = ["all", "mocks"]
