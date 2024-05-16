// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MultisigWallet{

    event Deposit(address indexed  sender, uint256 amount,uint256 balance);
    event Submittransaction(address indexed  owner,uint256 indexed  txIndex,address indexed to,uint256 value,bytes data);
    event ConfirmTransaction(address indexed  owner,uint256 indexed txIndex);
    event RevokeConfirmation(address indexed  owner,uint256 indexed txIndex);
    event ExecuteTransaction(address indexed  owner,uint256 indexed txIndex);

    address[] public owners;

    mapping(address => bool)public isOwner;
    uint256 public numConfirmationRequired;

    struct Transaction{
        address to;
        uint256 value;
        bytes data;
        bool executed;
        uint256 numConfirmation;
    }

    //mapping from tx index => owner => bool

    mapping(uint256 =>mapping(address =>bool))public isConfirmed;

    Transaction[] public transactions;

    modifier onlyOwner(){
        require(isOwner[msg.sender],"not owner");
        _;
    }

    modifier  txExists(uint256  _txIndex){
        require(_txIndex <transactions.length,"tx does not exists");
        _;
    }
    modifier notExecuted(uint256 _txIndex){
        require(!transactions[_txIndex].executed,"tx already executed");
        _;
    }

    modifier notConfirmed(uint256 _txIndex){
        require(!isConfirmed[_txIndex][msg.sender],"tx already confirmed");
        _;
    }

    constructor(address[] memory _owners,uint256 _numConfirmationsRequird){
        require(_owners.length > 0, "owners required");
        require(_numConfirmationsRequird >0 && _numConfirmationsRequird <= _owners.length,"invalid number of confirmation required");
        for (uint256 i=0; i< _owners.length;i++){
            address owner = _owners[i];
            require(owner != address(0),"invalid owner");
            require(!isOwner[owner],"owner not unique");

            isOwner[owner] =true;
            owners.push(owner);
        }
        numConfirmationRequired = _numConfirmationsRequird;
    }
    receive() external payable { 
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function submitTransaction(address _to,uint256 _value,bytes memory _data)public onlyOwner{
        uint256 txindex = transactions.length;

        transactions.push(Transaction({to:_to,
        value:_value,data:_data, executed:false,
        numConfirmation:0}));
        emit Submittransaction(msg.sender,txindex, _to, _value, _data);
    }

    function confirmTranaction(uint256 _txIndex)public onlyOwner txExists(_txIndex) notExecuted(_txIndex) notConfirmed(_txIndex){
        Transaction storage transaction = transactions[_txIndex];
        transaction.numConfirmation +=1;
        isConfirmed[_txIndex][msg.sender] =true;

        emit ConfirmTransaction(msg.sender, _txIndex);
    }
    function executeTransaction(uint256 _txIndex)public onlyOwner txExists(_txIndex) notExecuted(_txIndex){
        Transaction storage transaction = transactions[_txIndex];
        require(transaction.numConfirmation >= numConfirmationRequired,"cannot execute tx");
        transaction.executed =true;

        (bool success,) = transaction.to.call{value: transaction.value}(transaction.data);
        require(success,"tx failed");

        emit ExecuteTransaction(msg.sender, _txIndex);
    }
    function revokeConfirmation(uint256 _txIndex)public onlyOwner   txExists(_txIndex) notExecuted(_txIndex){
        Transaction storage transaction = transactions[_txIndex];

        require(isConfirmed[_txIndex][msg.sender],"tx not confirmed");

        transaction.numConfirmation -=1;
        isConfirmed[_txIndex][msg.sender] =false;

        emit RevokeConfirmation(msg.sender, _txIndex);

    }

    function getOwners()public view returns(address[] memory){
        return owners;
    }
    function getTransactionCount()public view returns(uint256){
        return transactions.length;
    }

    function getTransaction(uint256 _txIndex)public view returns(Transaction memory){
        return transactions[_txIndex];
    }

}