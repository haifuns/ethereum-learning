// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// SafeMath 库
contract SafeMathTester {

    uint8 public bigNumber = 255; // checked, solidity 0.6.0 unchecked

    function add() public {
        unchecked {bigNumber = bigNumber + 1;}
    }
}