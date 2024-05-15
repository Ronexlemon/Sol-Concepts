// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Car{
    address public owner;
    string public model;
    address public carAddr;

    constructor(address _owner,string memory _model){
        owner = _owner;
        model =_model;
        carAddr = address(this);

    }

}

contract CarFactory{
    Car[] public cars;

    function create(address _owner, string memory _model)public{
        Car car = new Car(_owner,_model);
        cars.push(car);
    }
}