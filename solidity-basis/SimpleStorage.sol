// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    string public text;

    // aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    // calldata 89626 gas
    // memory 90114 gas
    function set(string calldata _text) external {
        text = _text;
    }

    // copy from storage to memory and return
    function get() external view returns (string memory) {
        return text;
    }
}