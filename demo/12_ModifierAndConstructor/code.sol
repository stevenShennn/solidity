// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract  ModifierAndConstructor{

    address _owner ;

    // constructor 是新版本的solidity的构造函数，下面是他的写法，构造函数的含义就不再解释了
    constructor (){
        // 发布合约的钱包就是owner
        _owner = msg.sender;
    }


    // modifier 装饰器，可以理解为传统web服务的中间件服务midderware

    modifier OnlyOwner {
        // 要求调用的人必须是owner，否则就报错
        require(msg.sender == _owner);
        // _; 代表接下来的逻辑，占用位
        _;
    }

    // 代表转账函数使用了OnlyOwner 装饰器，在调转账之前，就必须先调用OnlyOwner进行检测
    function transfer ()external OnlyOwner returns (bool){
        // do transfer 。。。
    }

}