// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract EtherWallet{

    address payable  public  owner;

    constructor(){
        owner =  payable(msg.sender) ;
    }

    receive() external payable { }
    modifier onlyOwner(){
        require(msg.sender == owner,"only owner");
        _;
    }

    function withdraw(uint256 _amount)external  onlyOwner{
        payable(msg.sender).transfer(_amount); 
    }
    function withDrawAllTheAmount()external  onlyOwner{
        payable(msg.sender).transfer(address(this).balance) ;
    }

    function getBalance()external  view returns(uint256){
        return address(this).balance;
    }
}