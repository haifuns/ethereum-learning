// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./PriceConverter.sol";

// 1. 从用户处获取资金
// 2. 提取资金
// 3. 设定最低资金价值（美元）

contract FundMe {

    // 使用library
    using PriceConverter for uint256;

    uint256 public minimunUsd = 50 * 1e18;

    address[] public funders;

    mapping(address => uint256) public addressToAmountFunded;

    // 发送ETH到合约, payable 修饰支付函数
    function fund() public payable {
        // 部署时发送的ETH至少50美元, 1ETH=1e18Wei
        //require(getConversionRate(msg.value) >= minimunUsd, "Didn't send enough!");
        require(msg.value.getConversionRate() >= minimunUsd, "Didn't send enough!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    // function withdraw() {}
}
