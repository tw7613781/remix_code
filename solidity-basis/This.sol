// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract This {
    function getThis() external view returns (address) {
        return address(this);
    }
}