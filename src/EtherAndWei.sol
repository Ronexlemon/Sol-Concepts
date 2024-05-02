// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


contract EtherAndWei{
    uint256 public onewei = 1 wei;
    //1 wei is equal to 1;
    bool public  isOneWei = 1 wei == 1;

    uint256 public oneEther = 1 ether;
    // 1 ether is eual to 1^18 wei
    bool public isOneEther = 1 ether == 1e18;
}