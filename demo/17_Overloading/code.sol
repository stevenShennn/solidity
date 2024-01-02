// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


// 重载就是可以实现多个方法同名，但是由于入参数不同，所以属于不同的函数选择器
contract Overload {
    function saySomething() public pure  returns(string memory) {
        return ("nothing");
    }

    function saySomething (string memory _in) public pure returns (string memory) {
        return _in;
    }
}
