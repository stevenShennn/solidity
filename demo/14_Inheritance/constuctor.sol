// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


// modifier 重写
contract Person {
    uint public _age;

    constructor (uint _a){
        _age = _a;
    }
}

contract Steven is Person {
    // 这里可以简单解释一下：
    // 创建steven 的时候会传入_c ，但是我如果传入的就算是1或者任意数，实例化Person的时候始终传入的都是2，
    // 所以最终结果始终是 2
    constructor(uint _c)Person(2) {}
}



