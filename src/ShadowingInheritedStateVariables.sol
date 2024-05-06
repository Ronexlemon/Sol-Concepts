// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract A{
    string public name = "Contract A";

    function getName()public view returns(string memory){
        return name;
    }


}

contract B is A{
    constructor(){
        name = "Contract B";
    }


}