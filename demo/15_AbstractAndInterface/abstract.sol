// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


abstract contract  Abstract {
    // 抽象类 + 继承， 可以进行为完成的方法继续编写
    // 抽象类和接口很类似，但是接口是通用规范
    // 1. 抽象类可以存在实现，但是接口是不允许实现的

    string public _name = "hahha";

    function name() public  view virtual {
        uint   a = 1 ;
        uint b = a * a ;
    }

    function age() public  view virtual  returns (uint);
}


contract AbImpl is Abstract {
    function age() public view virtual override  returns (uint){
        return 1;
    }

    function getName() public view returns (string memory) {
        return Abstract._name;
    }
}


