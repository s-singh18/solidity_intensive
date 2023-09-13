// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Types1 {
    // Value types
    bool public boolean1 = true;
    bool public boolean2; // defaults to false
    uint public myUint1 = 1;
    uint public myUint2; // defaults to 0
    uint256 public myUint3 = 1;
    uint8 public myUint4 = 1; // Largest number (2 ** 8) - 1
    uint16 public myUint5 = 1;
    int public myInt1 = -1;
    int256 public myInt2 = -1;
    string public str1 = "My String";
    address public addr1 = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;
}
