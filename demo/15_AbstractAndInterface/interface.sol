// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


interface Interface {


    // 接口方法必须是外部调用： 描述符号必须是： external
    // 接口只能继承接口，不能继承合约
    // 不能包含状态变量、构造方法
    // 继承接口的非抽象合约必须实现接口定义的所有功能
    function name()external   ;
    function age() external   ;
}


contract IntImpl is Interface {
    event Log (string content );
    function name() external  {
        emit  Log("steven");
    }

    function age() external  {
        emit Log("2");
    }
}


