require("@nomicfoundation/hardhat-toolbox")
require("dotenv").config()

const SEPOLIA_RPC_URL = process.env.SEPOLIA_RPC_URL
// for test
const PRIVATE_KEY = process.env.PRIVATE_KEY

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
    defaultNetwork: "hardhat", // 默认
    networks: {
        spolia: {
            url: SEPOLIA_RPC_URL,
            accounts: [PRIVATE_KEY],
            //chainId: 11155111,
        },
    },
    solidity: "0.8.18",
}
