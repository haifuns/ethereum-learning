// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ManualToken {

    // address => tokens
    mapping(address => uint256) private s_balances;

    // 令牌名称
    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function symbol() public pure returns (string memory) {
        return "Manual Token";
    }

    // 令牌使用的小数位数 - 例如8，表示将令牌数量除以100000000得到其用户表示
    function decimals() public pure returns (uint8) {
        return 18;
    }

    // 代币总供应量
    function totalSupply() public pure returns (uint256) {
        return 100 ether; // 100000000000000000000 
    }

    // 余额
    function balanceOf(address _owner) public view returns (uint256 balance) {
        balance = s_balances[_owner];
    }

    // 转移令牌
    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
        success = true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {

    }

    function approve(
        address _spender,
        uint256 _value
    ) public returns (bool success) {

    }

    function allowance(
        address _owner,
        address _spender
    ) public view returns (uint256 remaining) {
 
    }
}
