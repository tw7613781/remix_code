// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 小猪存钱罐,当要用钱的时候,需要把存钱罐打烂.
contract PiggyBank {
    event Deposit(uint amount, address addr);
    event Withdraw(uint amount, address addr);

    address public owner = msg.sender;

    receive() external payable {
        emit Deposit(msg.value, msg.sender);
    }

    function withdraw() external {
        require(msg.sender == owner, "not owner");
        emit Withdraw(address(this).balance, msg.sender);
        selfdestruct(payable(msg.sender));
    }

    function getBalance() external view returns (uint){
        return address(this).balance;
    }
}