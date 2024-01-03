// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;



// 这里存在一个逻辑：
// 1. 合约只能存在一个receive函数，如果存在多个，就会报错
contract FallBackAndReceive{

    // receive()函数是在合约收到ETH转账时被调用的函数。
    // 一个合约最多有一个receive()函数，声明方式与一般函数不一样，
    // 不需要function关键字：receive() external payable { ... }。
    // receive()函数不能有任何的参数，不能返回任何值，必须包含external和payable。

    event Receive(address msgSender, uint value);

    receive() external payable {
        emit Receive(msg.sender,msg.value);
    }

    event Fallback(address msgsender,uint value ,bytes data);

    fallback()external payable{
        emit Fallback(msg.sender,msg.value,msg.data);
    }
}
