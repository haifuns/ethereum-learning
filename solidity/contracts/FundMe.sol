// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./PriceConverter.sol";

// 1. 从用户处获取资金
// 2. 提取资金
// 3. 设定最低资金价值（美元）

contract FundMe {
    // 使用library
    using PriceConverter for uint256;

    // 定义成constant, immutable 更节约 gas 
    uint256 public constant MINIMUM_USD = 50 * 1e18; // 1 * 10 ** 18

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    // 不可变的 immutable
    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    // 发送ETH到合约, payable 修饰支付函数
    function fund() public payable {
        // 部署时发送的ETH至少50美元, 1ETH=1e18Wei
        //require(getConversionRate(msg.value) >= minimunUsd, "Didn't send enough!");
        require(
            msg.value.getConversionRate() >= MINIMUM_USD,
            "Didn't send enough!"
        );
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    // 提取
    function withdraw() public onlyOwner {

        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);

        // 发送资产三种方式:
        // 1. transfer(2300 gas, throws error), msg.sender = address, payable(msg.sender) = payable address
        //payable(msg.sender).transfer(address(this).balance);
        // 2. send(2300 gas, returns bool)
        //bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // 3. call(forward all gas or set gas, returns bool)，推荐使用
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed!");
    }

    // modifier 修饰器
    modifier onlyOwner {
        require(msg.sender == i_owner, "Sender is not owner!"); // 前置处理
        _; // 相当于执行原始函数
        // 后置处理
    }
}
