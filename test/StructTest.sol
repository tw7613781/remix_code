// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Struct {

    uint256 public constant DECIMALS = 18;

    struct Validator {
        address validatorAddr;
        uint256 stakingAmount;
        uint256 rewardAmount;
        bool isValid;
        uint256 validChangeTime;
    }

    mapping(address => Validator) public validators;

    function addValidator(address validatorAddr) public {
        require(validatorAddr != address(0), "Invalid address.");

        require(
            validators[validatorAddr].validatorAddr == address(0),
            "Validator is already added."
        );

        validators[validatorAddr] = Validator(
            validatorAddr,
            0,
            0,
            true,
            block.timestamp
        );
    }

    // 删除质押节点
    function removeValidator(address validatorAddr) public {
        require(validatorAddr != address(0), "Invalid address.");
        require(validators[validatorAddr].validatorAddr != address(0), "Validator not Exist.");

        Validator storage validator = validators[validatorAddr];
        validator.isValid = false;
        validator.validChangeTime = block.timestamp;
    }

    function test() external pure returns (uint256) {
        return 10**DECIMALS;
    }
}