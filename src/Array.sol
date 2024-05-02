// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Array{
    //several ways to initialize an array
    uint256[]public arr;
    uint256[] public arr2 =[1,2,3];

    //fixed size array, all elements initialize to 0
    uint256[10] public myFixedSizeArr;

    function get(uint256 _index)public view returns (uint256){
        return arr[_index];
    }

    //solidity can return the entire array
    //but this function should be avoided for
    //arrays that can grow indefinitely in length

    function getArr()public view returns(uint256[] memory){
        return arr;
    }
    function push(uint256 _val)public{
        arr.push(_val);
    }
    function pop()public{
        arr.pop();
    }
    function getLength()public view returns(uint256){
        return arr.length;
    }
    function remove(uint256 _index)public{
        //delete does not change the length of the array
        //it resets the value at index to its default value,
        //in this case 0;
        delete arr[_index];
    }


}

/**
* Remove array element by shofting from right to left
*/
contract ArrayRemoveByShifting{
    //[1,2,3] -- remove(1) --> [1,3,3] --> [1,3]
    //[1,2,3,4,5,6] -- remove(2) -->[1,2,4,5,6,6] --> [1,2,4,5,6]
    //[1] -- remove(0) --> [1] -->[]

    uint256[] public arr;

    function remove(uint256 _index)public{
        require(_index < arr.length,"index out of bound");
        for(uint256 i= _index; i < arr.length -1;i++){
            arr[i] = arr[i+1];
        }
        arr.pop();
    }

}