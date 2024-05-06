// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
/**
functions thats is going to be ovveriden by a child contract must be declared as virtual
function that is going to be overide a parent function must  use the keyword ovveride
*/

contract InheritanceA{

function foo()public pure virtual returns(string memory){
    return "A";
}

}

contract InheritanceB is InheritanceA{

function foo()public pure virtual override  returns(string memory){
    return "B";
}

}

contract InheritanceC is InheritanceA{

function foo()public pure virtual override  returns(string memory){
    return "C";
}


}

// Contracts can inherit from multiple parent contracts.
// When a function is called that is defined multiple times in
// different contracts, parent contracts are searched from
// right to left, and in depth-first manner.
contract InheritanceD is InheritanceB,InheritanceC{
// since C is the right most parent contract with function foo();
function foo()public pure override(InheritanceB,InheritanceC)  returns(string memory){
    return super.foo();
}

}

contract InheritanceE is InheritanceC,InheritanceB{
// since C is the right most parent contract with function foo();
function foo()public pure override(InheritanceC,InheritanceB)  returns(string memory){
    return super.foo();
}

}

contract InheritanceF is InheritanceA,InheritanceB{
// since C is the right most parent contract with function foo();
function foo()public pure override(InheritanceA,InheritanceB)  returns(string memory){
    return super.foo();
}

}

