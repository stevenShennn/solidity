/**
 *Submitted for verification at testnet.bscscan.com on 2023-04-04
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;



contract OtherContract {
    uint256 private _x =0 ;
    event Log(uint amount ,uint gas);

    function getBalance() public view  returns (uint) {
        return address(this).balance;
    }

    function setX(uint256 x) external payable {
        _x = x;

        if (msg.value >0){
            emit Log(msg.value,gasleft());
        }
    }

    // 读取x
    function getX()external  view returns (uint x){
        x= _x;
    }
}


contract Call {
    event Response (bool success ,bytes data);

    function callSetX(address payable _addr,uint x) public payable {
        (bool success ,bytes memory data) = _addr.call{value : msg.value}(
            abi.encodeWithSignature("setX(uint256)", x)
        );

        emit Response(success, data);
    }

    function callGetX(address _addr) external returns (uint256) {
        // call getX()

        (bool success ,bytes memory data) = _addr.call(
            abi.encodeWithSignature("getX()")
        );

        emit Response(success, data);
        return abi.decode(data, (uint256));
    }


    function callNonExist(address _addr) external {
        (bool success ,bytes memory data) = _addr.call(
            abi.encodeWithSignature("foo(uint256)")
        );

        emit Response(success, data);
    }
}