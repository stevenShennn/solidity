// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract  ConstantAndImmutable{

    // constant : 在初始化的时候赋值，其他任何时间不得更改，否则报错
    // Immutable ： 在初始化或者构造函数中赋值，可以更加灵活

    uint public constant MAX_AGE =100 ;

    // 下面这么写就会报错
    // uint public constant MIN_AGE;

    // 使用imutable 一定要赋值，否则就会编译失败
    uint public immutable MIN_AGE;

    constructor (){
        MIN_AGE = 0;
    }

}