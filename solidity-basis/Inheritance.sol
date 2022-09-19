// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    event Log(string);

    function foo() public virtual returns (string memory) {
        emit Log("A.foo");
        return "A";
    }
}

// Contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    // Override A.foo()
    function foo() public virtual override returns (string memory) {
        emit Log("B.foo");
        return "B";
    }

    function bOnly() public pure returns (string memory) {
        return "bOnly";
    }
}

contract C is A {
    // Override A.foo()
    function foo() public virtual override returns (string memory) {
        emit Log("C.foo");
        return "C";
    }
}

// Contracts can inherit from multiple parent contracts.
// When a function is called that is defined multiple times in
// different contracts, parent contracts are searched from
// right to left, and in depth-first manner.

contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public override(B, C) returns (string memory) {
        emit Log("D.foo");
        return super.foo();
    }
}

contract E is C, B {
    // E.foo() returns "B"
    // since B is the right most parent contract with function foo()
    function foo() public override(C, B) returns (string memory) {
        emit Log("E.foo");
        return super.foo();
    }
}

// Inheritance must be ordered from “most base-like” to “most derived”.
// Swapping the order of A and B will throw a compilation error.
contract F is A, B {
    function foo() public override(A, B) returns (string memory) {
        emit Log("F.foo");
        return super.foo();
    }
}

//     G
//    / \
//   H   I
//    \ /
//     J 

contract G {
    event Log(string);

    function foo() public virtual  {
        emit Log("F.foo");
    }
}

contract H is G {
    function foo() public virtual override {
        emit Log("H.foo");
    }
}

contract I is G {
    function foo() public virtual override {
        emit Log("I.foo");
    }
}

contract J is I, H {
    function foo() public virtual override(H, I) {
        emit Log("J.foo");
        I.foo();
        super.foo();
    }
}