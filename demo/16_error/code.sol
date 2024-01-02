// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

    error TransferErr(address sender);
contract Err {
    mapping (address => uint256) _balance ;
    address _owner ;
    function transfer(address reciver ) external {

        // 使用 error + revert 组合
        if (msg.sender != _owner) {
            revert TransferErr(msg.sender);
        }

        // 使用require
        require(msg.sender == _owner,"....");

        // 使用assert
        assert(msg.sender == _owner);
    }
}


