// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const { ethers, run, network } = require("hardhat")

async function main() {
    const simpleStorageFactory = await ethers.getContractFactory(
        "SimpleStorage"
    )
    console.log("Deploying contract...")
    const simpleStorage = await simpleStorageFactory.deploy()
    await simpleStorage.deployed()
    console.log(`Deployed to ${simpleStorage.address}`)

    console.log(network.config)
    // 4 == "4" true
    // 4 === "4" false, === 不进行强转
    // chainId 31337 是本地hardhat网络
    // process.env.ETHERSCAN_API_KEY 存在 true, 不存在 false
    if (network.config.chainId !== 31337 && process.env.ETHERSCAN_API_KEY) {
        await simpleStorage.deployTransaction.wait(6) // 等待6个区块
        await verify(simpleStorage.address, [])
    }
}

// 验证合约
async function verify(contractAddress, args) {
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

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exitCode = 1
    })
