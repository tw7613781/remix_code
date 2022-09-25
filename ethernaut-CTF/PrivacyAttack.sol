// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// storage layout
/*
0x0000000000000000000000000000000000000000000000000000000000000001
0x000000000000000000000000000000000000000000000000000000006330641c
0x00000000000000000000000000000000000000000000000000000000641cff0a
0x94344d88bd2a6bb20b15838dc1e260f1aef5790df4d4234bb32e8972f0b34071
0xdcb829c957a0430ab5432d30b7e7a4658904f7558770fb2663291762eaead6ae
0xae466a8fcd686b3275340a3e26b4ce1e0e8aefdb67ba248966607f270ad6d50f
0x0000000000000000000000000000000000000000000000000000000000000000
0x0000000000000000000000000000000000000000000000000000000000000000
0x0000000000000000000000000000000000000000000000000000000000000000
0x0000000000000000000000000000000000000000000000000000000000000000
*/

/*
0xae466a8fcd686b3275340a3e26b4ce1e
*/

contract Privacy {

  bool public locked = true;
  uint256 public ID = block.timestamp;
  uint8 private flattening = 10;
  uint8 private denomination = 255;
  uint16 private awkwardness = uint16(now);
  bytes32[3] private data;

  constructor(bytes32[3] memory _data) public {
    data = _data;
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }
  /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
  */
}

contract Helper {
  function typeConvert(bytes32 _data) external pure returns (bytes16) {
      return bytes16(_data);
  }
}