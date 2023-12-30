// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract  Event{
    mapping  (address => uint256) public _balance ;

    // 定义转账的Event
    // indexed 最多不超过3个，否则会报错
    // 所有indexed 内容都会被记录到 topic中
    // topic【0】 是基于 keccak256("Transfer(address,address,uint256)") 得出来的
    // 没有indexed 描述得内容就存到log日志的data部份，存储内容更大，gas费用更低
    event Transfer (address indexed from ,address indexed to ,uint256 indexed amount ,uint256 timestamp);

    // 定义转账方法
    function _transfer (
        address from,
        address to,
        uint256 amount
    )external {
        _balance[from] = 100000;
        _balance[from] -= amount;
        _balance[to] += amount;
        uint256 timestamp = amount;

        emit Transfer(from, to, amount, timestamp);
    }

}