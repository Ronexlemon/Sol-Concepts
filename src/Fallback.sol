// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/***
*fallback is a special function that is executed either when
**a function that does not exist
** Ether is sent directly to a contract but receive() does not exits or msg.data is not empty
** It has 2300gas limit when called by "transfer" or "send"
*
*
*
**/
contract Fallback{
    event Log(string func,uint256 gas);
    fallback() external payable { 
        emit Log("fallback", gasleft());
    }
    receive() external payable {
        emit Log("receiver", gasleft());
     }

     //helper function tocheck balance
     function getBalance() public  view returns(uint256){
        return address(this).balance;
     }

}

contract  SendToFallback{
    function transfterToFallbak(address payable _to)public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to)public payable {
        (bool sent,) = _to.call{value:msg.value}("");
        require(sent,"transaction failed");

    }
}

//fallback can optionaly take bytes for input and output

contract   FallBackInputOutput{
    address immutable target;
    constructor(address _target){
        target= _target;
    }
}