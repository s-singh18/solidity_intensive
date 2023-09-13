// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Read functions are free
// Write functions cost gass
// Write function with arguments
// Write functions without arguments
// Gas prevents spam on the network
contract Functions1 {
    string name = "Example 1";

    function setName(string memory _name) public {
        name = _name;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function resetName() public {
        name = "Example 1";
    }
}

contract Functions2 {
    uint public count;

    function increment() public {
        count = add(count, 1);
    }

    function add(uint a, uint b) internal pure returns (uint) {
        return a + b;
    }
}

function addNumbers(uint a, uint b) pure returns (uint) {
    return a + b;
}

contract Functions3 {
    uint public count;

    function increment() public {
        count = addNumbers(count, 1);
    }
}

contract Functions4 {
    uint public count;

    function increment1() public {
        count++;
    }

    function increment2() public {
        increment1();
    }

    function increment3() private {
        count = count + 1;
    }

    function increment4() public {
        increment3();
    }

    function increment5() external {
        count++;
    }

    function increment6() internal {
        count++;
    }

    function increment7() external {
        increment6();
    }
}

contract Functions5 {
    string public name = "Example 5";
    uint public balance;

    function getName() public view returns (string memory) {
        return name;
    }

    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    function pay() public payable {
        balance = msg.value;
    }
}

contract Functions6 {
    address private owner;
    string public name;
    bool nameSet;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller must be owner");
        _;
    }

    modifier onlyOnce() {
        require(nameSet == false, "can only set name once");
        _;
    }

    function setName1(string memory _name) public onlyOwner {
        require(msg.sender == owner, "caller must be owner");
        name = _name;
    }

    function setName2(string memory _name) public onlyOwner onlyOnce {
        name = _name;
        nameSet = true;
    }
}

// Return Values
contract Functions7 {
    string name = "Example 7";

    function getName1() public view returns (string memory) {
        return name;
    }

    function getName2() public view returns (string memory) {
        name;
    }

    function getName3() public view returns (string memory) {
        return getName1();
    }

    function getName4() public view returns (string memory anotherName) {
        anotherName = "Another name";
    }

    function getName5() public view returns (string memory anotherName) {
        anotherName = getName4();
    }

    function getName6()
        public
        view
        returns (string memory name1, string memory name2)
    {
        return (name, "New name");
    }

    function getName7()
        public
        view
        returns (string memory name1, string memory name2)
    {
        (name1, name2) = getName6();
        return (name1, name2);
    }

    // Values returned from a transaction are not available outside of EVM.
    // Use events to accomplish this (see events lesson)
    event NameChanged(string name);

    function setName1() public returns (string memory) {
        name = "New name";
        emit NameChanged(name);
        return name;
    }

    function setName2() public returns (string memory newName) {
        newName = "New name";
        name = newName;
        return name;
    }

    function setName3() public returns (string memory newName) {
        newName = setName2();
        emit NameChanged(newName);
        return newName;
    }
}
