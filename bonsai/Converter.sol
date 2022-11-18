// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Converter {
    function int2uint(int256 num) external pure returns (uint256) {
        return uint(num);
    }
}