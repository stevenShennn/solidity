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
}

contract Steven is Person {
    function name ( ) public virtual  override{
        emit Log("steven");
    }

    function age () public virtual  override {
        emit Log("29");
    }
}


