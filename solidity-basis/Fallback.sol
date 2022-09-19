// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fallback {
    event Log(uint gas);

    // Fallback function must be declared as external.
    fallback() external {
        // send / transfer (forwards 2300 gas to this fallback function)
        // call (forwards all of the gas)
        emit Log(gasleft());
    }

    receive() external payable {}

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}

contract FallbackVsReceive {
    event Log(string func, address sender, uint value, bytes data);

    fallback() external {
        emit Log("fallback", msg.sender, 1, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}