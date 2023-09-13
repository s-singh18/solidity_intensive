// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// https://eth-converter.com/
contract Ether1 {
    uint public value1 = 1 wei;
    uint public value2 = 1;
    uint public value3 = 1 gwei;
    uint public value4 = 1e9;
    uint public value5 = 1 ether;
    uint public value6 = 1e18;
}

contract Ether2 {
    receive() external payable {}
}

contract Ether3 {
    uint public count = 0;

    fallback() external payable {
        count++;
    }

    function checkBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract Ether4 {
    function transfer1(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function transfer2(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}

contract Ether5 {
    uint public balance;

    function deposit1() public {
        // Not payable, will fail
        // balance += msg.value;
    }

    function deposit2() public payable {
        balance += msg.value;
    }
}
