// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Mapping examples (key value pairs)
contract Mappings1 {
    mapping(uint => string) public names;
    mapping(uint => address) public addresses;
    mapping(address => uint) public balances;
    mapping(address => bool) public hasVoted;

    constructor() {
        names[1] = "Adam";
        names[2] = "Ben";

        addresses[1] = 0x3EcEf08D0e2DaD803847E052249bb4F8bFf2D5bB;
        addresses[2] = 0xe5c430b2Dd2150a20f25C7fEde9981f767A48A3c;

        balances[addresses[1]] = 1 ether;
        balances[addresses[1]] = 2 ether;

        hasVoted[addresses[1]] = true;
        hasVoted[addresses[2]] = true;
    }
}

contract Mappings2 {
    struct Book {
        string author;
        string title;
    }

    mapping(uint => Book) public books;

    // Nested mapping
    // Track token balances for a given account

    mapping(address => mapping(address => uint)) public balances;

    constructor() {
        books[1] = Book("A Tale of Two Cities", "Charles Dickens");
        books[2] = Book("Les Miserables", "Victor Hugo");

        address user1 = 0x3EcEf08D0e2DaD803847E052249bb4F8bFf2D5bB;
        address user2 = 0xe5c430b2Dd2150a20f25C7fEde9981f767A48A3c;
        address dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
        address weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

        balances[user1][dai] = 1 ether;
        balances[user2][weth] = 2 ether;
    }
}

contract Mappings3 {
    mapping(uint => string) public myMapping;

    function get(uint _id) public view returns (string memory) {
        return myMapping[_id];
    }

    function set(uint _id, string memory _value) public {
        myMapping[_id] = _value;
    }

    function remove(uint _id) public {
        delete myMapping[_id];
    }
}

contract Mappings4 {
    mapping(address => mapping(uint => bool)) public myMapping;

    function get(address _user, uint _id) public view returns (bool) {
        return myMapping[_user][_id];
    }

    function set(address _user, uint _id, bool _value) public {
        myMapping[_user][_id] = _value;
    }

    function remove(address _user, uint _id) public {
        delete myMapping[_user][_id];
    }
}
