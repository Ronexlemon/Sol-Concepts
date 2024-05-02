// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ReadAndWrite{

    //state Variables

    address public owner;
    uint256 public num;
//write
    function set(address _owner,uint256 _num)public{
        owner = _owner;
        num = _num;
    }
//read
    function get()public view returns(uint256,address){
        return(num,owner);
    }
}