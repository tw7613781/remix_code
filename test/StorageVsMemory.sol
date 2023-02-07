// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract StorageVsMemory {

    struct Person {
        string name;
        uint256 age;
        uint256 updateBlock;
    }

    Person public a;
    Person public b = Person({updateBlock: 1, name: "xxx", age: 10});

    function _updatePerson(Person memory person, string memory name, uint256 age) internal view {
        person.updateBlock = block.number;
        person.name = name;
        person.age = age;
    }

    function run() public {
        _updatePerson(a, "tangwei", 35);
        Person memory tmp = b;
        _updatePerson(tmp, "tangshu", 5);
        b = tmp;
    }
}