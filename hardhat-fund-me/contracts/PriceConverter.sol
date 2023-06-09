// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// library, 所有函数都需要是internal
library PriceConverter {

    // chainlink, 获取实时 ETH/USD 汇率
    function getPrice(AggregatorV3Interface priceFeed) internal view returns (uint256) {
        // ABI https://docs.chain.link/data-feeds/using-data-feeds
        // Address https://docs.chain.link/data-feeds/price-feeds/addresses
        //      Sepolia Testnet, ETH / USD, 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // AggregatorV3Interface priceFeed = AggregatorV3Interface(
        //     0x694AA1769357215DE4FAC081bf1f309aDC325306
        // );
        (,int256 answer,,,) = priceFeed.latestRoundData();
        // answer 190242000000
        return uint256(answer * 1e10);
    }

    // ETH -> USD
    function getConversionRate(uint256 ethAmount, AggregatorV3Interface priceFeed) internal view returns (uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        return (ethAmount * ethPrice) / 1e18;
    }
}