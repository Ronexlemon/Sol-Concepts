// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

library Hash{
    function hashtextuintaddress(string memory _text, uint256 _num, address _addr)external pure returns(bytes32){

        return keccak256(abi.encodePacked(_text,_num,_addr));

    }

    function hashtexttext(string memory _textone,string memory _texttwo)external pure returns(bytes32){
        return keccak256(abi.encode(_textone,_texttwo));
    } 

//example of a hash collision
//Hash collision can occur when you pass more than one dynamic data type
//to abi.encodePacked.>> in such case you should use abi.encode instead

    function hashCollisionStringString(string memory _textone,string memory _texttwo)external pure returns(bytes32){

        //encodePacked(AAA,BBB) -> AAABBB
        //encodePacked(AA,ABBB) -> AAABBB
        return keccak256(abi.encodePacked(_textone,_texttwo));
    } 



}


contract GuessTheMagicWord{

    bytes32 public answer = 0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    function getMagicWord(string memory _guess)public view returns(string memory){
        if(keccak256(abi.encodePacked(_guess)) == answer){
            return  "Won";
        }else{
             return  "Try Again";

        }
       
    }
}