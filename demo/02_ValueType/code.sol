// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract ValueType {
    // bool
    bool public _bool =true ;
    bool public _bool1 = !_bool;
    bool public _bool2 = _bool && _bool1;
    bool public _bool3 = _bool || _bool1;
    bool public _bool4 = _bool == _bool1;
    bool public _bool5 = _bool != _bool1;

    // 整数
    uint public _uint = 1 ;
    int public _int =-1 ;
    uint public _maxuint = type(uint).max; // uint 最大值
    int public _maxint = type(int).max; // int最大值
    uint256 public _maxuint256 = type(uint256).max;

    // 运算
    uint256 public _n1 = _uint +1 ;
    uint256 public _n2 = _uint + 2 ;
    uint256 public _n3 = 3**3 ;
    uint256 public _n4 = 7 %2 ;

    // 地址
    address public _address = 0x4d6a58E7B00530cd39197880c045FAE567Ab3831;
    address payable _address1 = payable (_address);// 后面单独地方讲解payable
    uint256 balance = _address1.balance;

    // 固定长度字节数组
    bytes32 public _bytes32 = "hahhaha";//0x6861686861686100000000000000000000000000000000000000000000000000
    bytes1 public _bytes1 = _bytes32[3];//0x68
    bytes1 public _bytes2 = _bytes32[1];//0x68
    bytes1 public _bytes3 = _bytes32[2];//0x68
    bytes2 public _bytes4 = _bytes32[2];//0x6800
    bytes2 public _bytes5 = _bytes32[3];//0x6800


    // uint 0,1,2 : 代表 buy，hold，sell
    enum ActionSet {Buy ,Hold,Sell}
    ActionSet public action = ActionSet.Buy;

    function enumToUint () external view returns (uint) {
        return uint(action);
    }

}