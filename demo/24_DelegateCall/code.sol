/**
 *Submitted for verification at testnet.bscscan.com on 2023-04-04
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;



contract C{
    uint public num ;
    address public sender ;
    function setVars (uint _num ) public payable {
        num = _num;
        sender = msg.sender;
    }
}


contract B {
    uint public num ;
    address public sender ;

    // 通过call 来调用C的setVars()函数，改变合约C中的变量状态
    function callSetVars(address _addr,uint _num ) external  payable {
        // call setVars()

        (bool success,bytes memory data )= _addr.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }


    function delegateCall(address _addr,uint _num) external  payable  {
        // delegate call
        (bool success ,bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}