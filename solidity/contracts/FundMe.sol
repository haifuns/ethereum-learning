// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// 1. 从用户处获取资金
// 2. 提取资金
// 3. 设定最低资金价值（美元）

contract FundMe {
    
    uint256 public minimunUsd = 50;

    // 发送ETH到合约, payable 修饰支付函数
    function fund() public payable {
        // 大于minimunUsd Wei, 1e18Wei = 1ETH
        require(msg.value >= minimunUsd, "Didn't send enough!");
    }

    // function withdraw() {}
}