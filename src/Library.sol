// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
*Libraries are similar to contracts, but you can't declare any state variable and you can't send ether 
**/

library Math{

    function sq(int _num)internal  pure returns(int s){
        s = _num * _num;
    }
}


contract TestMath{
    using  Math for int256;
    
    function squareNumber(int _num)public pure returns (int256){
        return Math.sq(_num);
    }
}

library Array{
    function remove(uint256[] storage arr,uint256 _index)public{
        require(arr.length >0,"Can't remove an empty array");
        arr[_index] = arr[arr.length-1];
        arr.pop();
    } 
}

contract TestArray{
    using Array for uint256[];

    uint256[] public arr;

    function testremoveArray()public{
        for (uint256 i=0; i<4;i++){
            arr.push(i);
        }
        arr.remove(2);
        assert(arr.length ==3);
        assert(arr[0] ==0);
        assert(arr[2]==3);
    }
}