// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/**
* you can send to other contracts by
*transfer -> (2300 gas,throws error)
*send -> (2300 gas, return bool)
*call -> (forward all gas or set ga, returns bool)
**NB -> a contract receiving ether must have at least one of the functions
**  receive() external payable
** fallback() external payable
** receive() i called if msg.data is empty, otherwise fallback() is called.
*/

//reciver ether when called by other smart contracts
contract ReceiverEther{
    function getBalance() public view returns(uint256){
        return address(this).balance;
    }
    //function to receiver ether . msg.data must be empty
    receive() external payable { }
    //fallback function i called when msg.data is not empty
    fallback() external payable { }


}

contract CanNotReceiverEther{
    function getBalance() public view returns(uint256){
        return address(this).balance;
    }
    


}

contract SendEther{

    //send via transfer
    function sendViaTransfer(address payable  _to)public payable{
        _to.transfer(msg.value);
    } 

    //sen Via Send
    function sendViaSend(address payable _to)public payable {
        bool sent = _to.send(msg.value);
        require(sent,"transaction failed");
    }

    //send via call
    function sendViaCall(address payable _to)public payable {
        (bool success,)= _to.call{value:msg.value}("");
        require(success,"failed transaction");
    }


}