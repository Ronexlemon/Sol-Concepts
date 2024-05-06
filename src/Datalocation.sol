// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract DataStorage{
    //Storage -> variable is a state variable (store on blockchain)
    //memory -> variable is in memory and it exits while a function is being called
    //calldata -> special data location that contains function arguments
    uint256[] public arr;

    mapping(uint256 => address) map;
    struct MyStruct{
        uint256 foo;
    }
    mapping(uint256 => MyStruct) mystructs;
    function f()public{
        _f(arr,map,mystructs[1]);
    }

    function _f(uint256[] storage _arr,mapping(uint256 => address) storage _map,
    MyStruct storage _mystruct)internal{
        //do something with storage variable

    }
//return memory variables
    function g(uint256[] memory _arr)public{
        //do somthing with memory varibales
    }

    function h(uint256[] calldata _arr)external{
        //do something
    }


}