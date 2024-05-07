// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/**
* delegatecall is a low level fuction similar to call
*When contract A executes delegatecall to contract B,B's code is executed with
contract A's storage, msg.sender and msg.value
*
*/

contract DelegateCallB{
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(uint256 _num)public payable {
        num= _num;
        sender = msg.sender;
        value = msg.value;

    }


}

contract DelegateCallA{
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(address _contract,uint256 _num)public payable {
        (bool success,) = _contract.delegatecall(abi.encodeWithSignature("setVars(uint256)",_num));

       
       require(success,"delegate call failed");

    }


}

