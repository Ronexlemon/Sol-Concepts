// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
** call -> is a low level function to interact with other contracts
*This is the recommended method to use when you're just sending Ether via calling the fallback function
*NB -> It is not the recommended way to call exitsing functions
*/

contract CallReceiver{
    event  Received(address caller,uint256 amount, string message);

    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
     }

     function foo(string memory _message, uint256 _x)public payable returns(uint256) {
        emit Received(msg.sender, msg.value, _message);
        return _x+1;
     }

}


contract Caller{
    event Response(bool success,bytes data);
    function testCallFoo(address payable _addr)public  payable {
        (bool success,bytes memory data) =  _addr.call{value:msg.value,gas:5000}(abi.encodeWithSignature("foo(string,uint256)","call foo",123));
        emit Response(success, data);
    }

     function testCallDoesNotExits(address payable _addr)public  payable {
        (bool success,bytes memory data) =  _addr.call{value:msg.value,gas:5000}(abi.encodeWithSignature("doesNotExist()"));
        emit Response(success, data);
    }
}