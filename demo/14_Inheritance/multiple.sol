// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract Person {
    event Log(string name);

    function name () public    virtual {
        emit  Log("person");
    }

    function age () public   virtual {
        emit  Log("35");
    }

    function hello() public {
        emit Log("hello ");
    }
}

contract Steven is Person {
    function name ( ) public virtual  override{
        emit Log("steven");
    }

    function age1 () public  {
        emit Log("29");
    }

    function say () public {
        emit  Log ("steven is good ");
    }
}

// 多重继承的注意点需要注意：如果继承的合约存在关联关系，那么下面继承写成Steven，Person 就会报错
// 如果存在一个函数，在继承函数中都存在，必须重写，如果stevenson 类不重写name 则会报错
// 重写的时候需要在override 后面加上那些父亲合约
contract StevenSon is Person,Steven {
    function name () public virtual override (Person,Steven){
        emit Log("stevenSon");
    }

    function age () public virtual  override (Person){
        emit  Log("2");
    }

}


