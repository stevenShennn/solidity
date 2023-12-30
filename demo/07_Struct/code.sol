// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract Struct {

    // 声明一个结构体位Person
    struct Person {
        uint age ;
        string name ;
    }

    // 声明一个niceBoy 为一个Person
    Person NiceBoy ;


    // 利用一storage类型进行赋值,storage进行指针赋值，
    // 修改两个值
    function initNiceBoyByStorage ()external  {
        Person storage _person = NiceBoy;
        _person.age =1;
        _person.name = "steven";
    }


    // 直接外部进行初始化访问
    function initNiceBoy ()external {
        NiceBoy.age =1;
        NiceBoy.name ="steven";
    }

    // 构造函数进行初始化访问
    function initNiceBoy2 ()external {
        NiceBoy = Person(1,"steven");
    }


    // kv实例化
    function initNiceBoy3 ()external {
        NiceBoy = Person({age: 1,name:"steven"});
    }
}