// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract Array{
    // 定长数组
    uint[8] arr1 ;
    uint256[10] arr2;
    bytes[3] arr3;

    // 不定长数组
    uint [] arr4;
    uint256 []arr5;
    bytes[] arr6;

    // 初始化可变长度数组
    uint[] public arr8 = new uint[](1);
    bytes public arr9 = new bytes(9);

    // 给可变长度数组赋值
    function initArray ()external  pure returns (uint[] memory){
        uint[] memory x = new uint[](3);
        x[1] =2 ;
        x[0]=1;
        x[2] =3;
        return (x);
    }

    // 将定长数组push道不定长的数组中
    function arrayPush (uint a )external  returns (uint[] memory){
        uint[2] memory content = [uint(1),2];
        content[0] =1 ;
        content[1] =2;
        arr4 = content;

        arr4.push(a);
        return arr4;
    }

}