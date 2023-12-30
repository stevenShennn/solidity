// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract Map {
    // 基础类型 mapping
    mapping (uint => address) public  userSet;

    // 注意 map的value 可以是任意的，但是key 只能是内置类型
    struct Person{
        string name;
    }
    // 下面这个会报错
    //  mapping (Person => uint) public demo;
    // 但是value 放置为自定义类型是支持的
    mapping (uint => Person) public personSet;

    // 通过这样进行修改内部的值
    function write(uint _key,address _value ) external {
        userSet[_key] = _value;
    }

    // 注意点： 不需要使用read函数来读取内容，一旦设置成为public，solidity会自动生成一个读取value的函数：getter
    // mapping 存储位置都是在storage上：下面这个就会报错
    function wrongWay ()external {
        // 这样写就会报错
        //mapping  (uint => address) set1 ;
    }

}