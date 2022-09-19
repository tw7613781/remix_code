// SPDX-License-Identifier: NONE
pragma solidity ^0.8.9;

contract PayableTest {
    event Transfer(uint count, address sender);

    function pay() public payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getRanddomBalance(address _a) public view returns (uint) {
        return _a.balance;
    }

    function transfer(address payable _account, uint256 _amount)
        public
        payable
    {
        // payable address类型需要用payable包裹
        payable(_account).transfer(_amount);
        emit Transfer(_amount, _account);
    }

    function transfer2() external payable {
        payable(this).transfer(msg.value);
        emit Transfer(msg.value, payable(this));
    }

    // 我没太明白为啥要实现这个方法
    fallback() external payable {}

    // 我没太明白为啥要实现这个方法
    receive() external payable {}
}
