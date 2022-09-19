// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssertAndRevert {
    uint num;

    function setNumAssert(uint _num) external {
        num = _num;
        assert(num != _num);
    }

    function setNumRevert(uint _num) external {
        num = _num;
        revert();
    }
}