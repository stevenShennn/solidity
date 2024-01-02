// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


// modifier 重写
contract Person {
    address _owner ;
    event Log(string name);
    modifier  CheckOwner () virtual{
        require(msg.sender == _owner );
        _;
    }
}

contract Steven is Person {

    // 重新去掉ownner判断
    modifier CheckOwner() override {
        _;
    }
}
