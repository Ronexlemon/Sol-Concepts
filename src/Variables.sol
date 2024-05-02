// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/**
*@author ronex
*@notice  solidity variables
*there three types of variables (local,state,global)
*Local -> describe inside a function, not stored on the blockchain
*State -> declared outside a function, stored on the blockchain
*Global -> provides information about the blockchain
*/

contract Variables{
    //state varibales
    string public name="Yollow";
    uint256 public num = 40;

    function doSomething()public view returns(uint,uint,address) {
        //local variables
        uint256 i=0;

        //global variables

        uint256 timetamp = block.timestamp;

        address sender = msg.sender;

        return(i,timetamp,sender);

    }


}