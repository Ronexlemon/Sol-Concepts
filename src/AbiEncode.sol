// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IERC20 {
    function transfer(address,uint256)external ;
    
}

contract Token{
    function transfer(address,uint256)external {}
    
}

contract AbiEncode{
    function test(address _contract,bytes calldata data)external {
        (bool ok,)= _contract.call(data);
        require(ok,"failed");
    }


    function encodeWithSignature(address _to,uint256 _amount)external pure returns (bytes memory){
        //typo is not checked => "transfer(address,uint)"
        return abi.encodeWithSignature("transfer(address,uint256)",_to,_amount);
    }

    function encodeWithSelector(address _to,uint256 _amount)external  pure  returns (bytes memory){
        //type is not checked =>  "(IERC20.transfer.selector,true,amount)
        return  abi.encodeWithSelector(IERC20.transfer.selector, _to,_amount);
    }
    function encodeCall(address _to, uint256 _amount)external  pure returns(bytes memory){
        //typo and type errors will not compile
        return abi.encodeCall(IERC20.transfer,(_to,_amount));
    }

}