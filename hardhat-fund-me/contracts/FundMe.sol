// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./PriceConverter.sol";

// 1. 从用户处获取资金
// 2. 提取资金
// 3. 设定最低资金价值（美元）

// custom error
error FundMe_NotOwner();

/**
 * @title 众筹合约
 * @author haifun
 * @notice 这是一个众筹合约示例
 * @dev 使用了 price feed 库
 */
contract FundMe {
    // 使用library
    using PriceConverter for uint256;

    // 定义成constant, immutable 更节约 gas 
    uint256 public constant MINIMUM_USD = 50 * 1e18; // 1 * 10 ** 18
    address[] private s_funders;
    mapping(address => uint256) private s_addressToAmountFunded;
    // 不可变的 immutable
    address private immutable i_owner;

    AggregatorV3Interface private s_priceFeed;

    // modifier 修饰器
    modifier onlyOwner {
        // 需要存储和发送长字符串，更耗费gas
        //require(msg.sender == i_owner, "Sender is not owner!"); // 前置处理
        // 使用custom error更节约gas
        if (msg.sender != i_owner) {
            revert FundMe_NotOwner();
        }
        _; // 相当于执行原始函数
        // 后置处理
    }

    constructor(address priceFeedAddress) {
        i_owner = msg.sender;
        s_priceFeed = AggregatorV3Interface(priceFeedAddress);
    }

    // 解决如果发送ETH, 但是不通过fund
    // receive ether function: receive(), fallback()
    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
    
    /**
     * @notice 吸纳资金
     * @dev 使用了 price feed 库
     */
    function fund() public payable {
        // 部署时发送的ETH至少50美元, 1ETH=1e18Wei
        //require(getConversionRate(msg.value) >= minimunUsd, "Didn't send enough!");
        require(
            msg.value.getConversionRate(s_priceFeed) >= MINIMUM_USD,
            "Didn't send enough!"
        );
        s_funders.push(msg.sender);
        s_addressToAmountFunded[msg.sender] += msg.value;
    }

    // 提取
    function withdraw() public onlyOwner {

        for (uint256 funderIndex = 0; funderIndex < s_funders.length; funderIndex++) {
            address funder = s_funders[funderIndex];
            s_addressToAmountFunded[funder] = 0;
        }

        s_funders = new address[](0);

        // 发送资产三种方式:
        // 1. transfer(2300 gas, throws error), msg.sender = address, payable(msg.sender) = payable address
        //payable(msg.sender).transfer(address(this).balance);
        // 2. send(2300 gas, returns bool)
        //bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // 3. call(forward all gas or set gas, returns bool)，推荐使用
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed!");
    }

    // 更节约gas的提取
    function cheaperWithdraw() public onlyOwner {
        address[] memory funders = s_funders;
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            s_addressToAmountFunded[funder] = 0;
        }
        s_funders = new address[](0);
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed!");
    }

    function getAddressToAmountFunded(address fundingAddress)
        public
        view
        returns (uint256)
    {
        return s_addressToAmountFunded[fundingAddress];
    }

    function getVersion() public view returns (uint256) {
        return s_priceFeed.version();
    }

    function getFunder(uint256 index) public view returns (address) {
        return s_funders[index];
    }

    function getOwner() public view returns (address) {
        return i_owner;
    }

    function getPriceFeed() public view returns (AggregatorV3Interface) {
        return s_priceFeed;
    }
}
