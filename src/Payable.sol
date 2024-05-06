// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Payable{
    address payable public owner;

    constructor()payable {
        owner = payable(msg.sender);
    }

    function deposit()public payable {}

    function withdraw()public{
        uint256 bal = address(this).balance;
        (bool success,) = owner.call{value:bal}("");
        require(success,"Transaction failed");

    }
}