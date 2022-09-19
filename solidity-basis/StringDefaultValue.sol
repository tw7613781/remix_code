// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringDefaultValue {
    string public name;

    function setName(string calldata _name) external {
        require(bytes(_name).length != 0, "cannot input empty string");
        name = _name;
    }
}