// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// receive ether function: receive(), fallback()
// https://solidity-by-example.org/fallback/
contract FallbackExample {

    uint256 public result;

    // 不需要function, 必须定义成external
    receive() external payable {
        result = 1;
    }

    // 数据与交易一起被发送时触发, 或者receive不存在时触发, 推荐使用fallback
    fallback() external payable {
        result = 2;
    }
}