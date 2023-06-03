// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// 1. 从用户处获取资金
// 2. 提取资金
// 3. 设定最低资金价值（美元）

contract FundMe {
    uint256 public minimunUsd = 50 * 1e18;

    // 发送ETH到合约, payable 修饰支付函数
    function fund() public payable {
        // 部署时发送的ETH至少50美元, 1ETH=1e18Wei
        require(getConversionRate(msg.value) >= minimunUsd, "Didn't send enough!");
    }

    // chainlink, 获取实时 ETH/USD 汇率
    function getPrice() public view returns (uint256) {
        // ABI https://docs.chain.link/data-feeds/using-data-feeds
        // Address https://docs.chain.link/data-feeds/price-feeds/addresses
        //      Sepolia Testnet, ETH / USD, 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        (,int256 answer,,,) = priceFeed.latestRoundData();
        // answer 190242000000
        return uint256(answer * 1e10);
    }

    // ETH -> USD
    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        return (ethAmount * ethPrice) / 1e18;
    }

    // test
    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        return priceFeed.version();
    }

    // test
    function getDecimals() public view returns (uint8) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        // 8
        return priceFeed.decimals();
    }

    // function withdraw() {}
}
