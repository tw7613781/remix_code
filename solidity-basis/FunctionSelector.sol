// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionSelector {
    event Log(bytes data);
    
    /*
    "transfer(address,uint256)"
    0xa9059cbb
    "transferFrom(address,address,uint256)"
    0x23b872dd
    */
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }

    function encode(address _to, uint _amount) external pure returns (bytes memory) {
        return abi.encode(_to, _amount);
    } 

    function transfer(address _to, uint _amount) external {
        // 0xa9059cbb
        // 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4
        // 0000000000000000000000000000000000000000000000000000000000000001
        emit Log(msg.data);
    }

    function encodeFunSig() external pure returns (bytes memory){
        return abi.encodeWithSignature("transfer(address,uint256)", 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 1);
    }
}