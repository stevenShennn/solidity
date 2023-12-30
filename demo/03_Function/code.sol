// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract Function{
    uint256 public _uint = 1 ;
    constructor () payable {}

    // 函数类型
    function add() external {
        _uint = _uint + 1 ;
    }

    // pure 修饰符
    function addPure(uint256 _number) external pure  returns (uint256 new_number){
        new_number = _number + 1;
    }


    // view 修饰符
    function addView () external  view  returns  (uint256 new_number){
        return _uint +1 ;
    }

    // internal 内部函数
    function  minus () internal  {
        _uint = _uint +1 ;
    }

    // 合约内部函数可以调用的内部函数
    function minusCall() external {
        minus();
    }

    //payable 能给合约付钱的操作
    // 意思是可以给合约转钱
    function minusPayable()external payable returns (uint256 balance){
        minus();
        balance = address(this).balance;
    }

}
