// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract Return {

    // 多个返回值的
    function returnMultiple ()public pure returns (uint256,bool,uint256[3] memory){
        return (1,true,[uint256(1),2,4]);
    }

    // 命名式返回
    function returnNamed() public pure returns (uint256 _number,bool _bool) {
        _number =2 ;
        _bool  =false;
    }

    // 命名式返回依然支持return
    function returnNamed2()public pure  returns (uint256 _number){
        return 1;
    }

    // 读取返回值，解够赋值
    function returnReturn()public pure {
        uint256 _num ;
        bool _bool ;
        uint256[3] memory _array;
        ( _num,_bool,_array )= returnMultiple();

        // 拿到部份值
        ( ,_bool) = returnNamed();
    }
}
