// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract InitialValue{
    // 初始化默认值，变量被声明后就会被赋值默认的Value

    bool public _bool ; //false
    string public _string ;// string
    int public _int ; // 0
    uint public _uint ;// 0
    address public _address ;// 0x00...

    // 自定义枚举，默认第一个
    enum Action {buy , sell}
    Action public _action ;// buy or 0

    // 空方法

    function fi()internal  {}
    function fe()external {}

    // 引用类型
    uint[2] public _staticArr ; // 默认 【0，0】
    uint[] public _dynamicArr ; // 默认【】
    mapping  (uint8 => address) public _mapping ; // 都默认为空

    // 自定义类型
    struct Person {
        uint age;  // 为uint 默认值
        string name; // 为string 默认值
    }
    Person public _person;

    // delete 操作符号，将值变成默认值
}