// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/**
**Function Selector
*when a function is called, the forst 4 bytes of calldata specifies which function to call
**This 4 byte is called a function selector***
*
***/

//How the function selector is computed

contract FunctionSelector{

    function getSelector(string calldata _func)external  pure returns(bytes4){
        return bytes4(keccak256(bytes(_func)));
    }
}