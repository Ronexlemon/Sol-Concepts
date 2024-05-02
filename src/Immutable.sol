// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/**
*Imuutable  variables are like constants, Once imutable values have been set they can't be changed afterwards only inside a constructor
*/

contract Immutable{

    address public immutable owner;
    uint256 public immutable price;

    constructor(uint256 _price){
        price = _price;
        owner = msg.sender;

    }


    //try to changed it

    function changedValues(uint256 _price,address newOwner)public{
        //price = _price;   -> Cannot write to immutable here: Immutable variables can only be initialized inline or assigned directly in the constructor


    }

}