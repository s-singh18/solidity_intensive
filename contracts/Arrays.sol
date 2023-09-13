// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Array initalization
// Homework: try more data types!
contract Arrays1 {
    uint[] public array1 = [1, 2, 3];
    uint[] public array2;
    uint[10] public array3;
    string[] public array4 = ["apple", "banana", "carrot"];
    string[] public array5;
    string[10] public array6;
}

contract Arrays2 {
    uint[] public array;

    function get(uint i) public view returns (uint) {
        return array[i];
    }

    function getArray() public view returns (uint[] memory) {
        return array;
    }

    function length() public view returns (uint) {
        return array.length;
    }

    function push(uint _value) public {
        array.push(_value);
    }

    function pop() public {
        array.pop();
    }

    function remove(uint index) public {
        delete array[index];
    }
}
