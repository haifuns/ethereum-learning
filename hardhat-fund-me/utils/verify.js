const { run } = require("hardhat")

// 验证合约
const verify = async (contractAddress, args) => {
    // 使用hardhat-etherscan api验证合约
    console.log("Verify contract...")
    try {
        await run("verify:verify", {
            address: contractAddress,
            constructArguments: args,
        })
    } catch (e) {
        if (e.message.toLowerCase().includes("already verified")) {
            console.log("Already Verified!")
        } else {
            console.log(e)
        }
    }
}

module.exports = { verify }
