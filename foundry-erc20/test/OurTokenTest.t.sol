// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.sol";
import {OurToken} from "../src/OurToken.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

contract OurTokenTest is StdCheats,Test {

    OurToken public ourToken;
    DeployOurToken public deployer;

    address public deployerAddress;
    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STRING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        deployerAddress = vm.addr(deployer.deployerKey());
        vm.prank(deployerAddress);
        ourToken.transfer(bob, STRING_BALANCE);
    }

    function testInitialSupply() public {
        assertEq(ourToken.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    function testTransfer() public {
        assertEq(STRING_BALANCE, ourToken.balanceOf(bob));
    }

     function testAllowances() public {
        uint256 initialAllowance = 1000;

        // bob 同意 alice 代表他使用token
        // Bob approves Alice to spend tokens on her behalf
        vm.prank(bob);
        ourToken.approve(alice, initialAllowance);
        uint256 transferAmount = 500;

        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transferAmount);
        assertEq(ourToken.balanceOf(alice), transferAmount);
        assertEq(ourToken.balanceOf(bob), STRING_BALANCE - transferAmount);
    }
}