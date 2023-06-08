// function deployFunc(hre) {
//     console.log("Hi")
// }
// yarn hardhat deploy 调用默认函数
// module.exports.default = deployFunc

const { network } = require("hardhat")

// hre.getNameAccounts
// hre.deployments
module.exports = async ({ getNameAccounts, deployments }) => {
    const {deploy, log} = deployments
    const {deployer} = await getNameAccounts()
    const chainId = network.config.chainId

}
