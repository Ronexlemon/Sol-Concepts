// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/**
*How much ether do you need to pay for a gas?
*-> you pay gas spent * gas price amount of ether, where
*         1. gas is a unit of computation
*         2. gas spent is the total amount of gas used in a transaction
*         3. gas price is how much ether you're willing to pay per gas
*/

contract Gas{

    uint256 public i=0;

    function forever()public{
        //run a loop until all the gas are spent
        //and transaction fails
        while(true){
            i++;
        }
    }

}