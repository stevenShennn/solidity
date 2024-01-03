/**
 *Submitted for verification at testnet.bscscan.com on 2023-04-04
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


    error SendFail(); // 使用send发送失败error
    error CallFailed() ;// call 失败

contract SendETH {

    // 构造函数，构造的时候可以支付eth
    constructor ()payable {}

    // receive方法，接受eth的时候被触发
    receive() external payable { }


    // 使用trasfer发送eth
    function transferETH(address payable _to, uint256 amount) external  {
        _to.transfer(amount);
    }

    // 使用send发送eth
    function sendETH(address payable _to,uint256 amount) external payable {
        bool successs = _to.send(amount);
        if (!successs){
            revert SendFail();
        }
    }


    // 使用call 发送eth
    function callETH (address payable _to,uint256 amount ) external  payable {
        (bool success,) = _to.call{value:amount}("");
        if (!success) {
            revert CallFailed();
        }
    }
}