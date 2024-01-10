/**
 *Submitted for verification at testnet.bscscan.com on 2023-04-04
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;



contract DeleteContract {

    uint public value =1 ;

    constructor ()payable {}

    receive() external payable { }

    function deleteContract ()external {
        selfdestruct(payable(msg.sender));
    }

    function getBalance ()external view  returns (uint balance){
        balance = address(this).balance;
    }
}