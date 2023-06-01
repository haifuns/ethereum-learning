// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./SimpleStorage.sol";

// 继承
contract ExtraStorage is SimpleStorage {

    // 函数重写，被重写的函数需要指定virtual，重写函数指定override
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}
