// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


contract DataStorage{

    uint[] public x =[1,2,3];

    // storage 是进行引用赋值
    function fStorage()public {
        uint[] storage xStorage = x;
        xStorage[0] = 100;
    }

    // memory 是直接内存拷贝,不会使用到原值
    function fMemory()public view {
        uint[] memory xMemory = x;
        xMemory[0] =1;
        uint[] memory xMemory2 = x;
        xMemory2[2] = 100;
    }

    function fCalldata(uint[] calldata _x) public pure returns (uint[] calldata){
        // 因为是calldata 所以修改_x 会被报错
        //_x[1]=2;
        return _x;
    }

}

contract Varialbles{
    uint public x =1 ;
    uint public y;
    string public z;
    function foo ()external  {
        // 外部调用可以改变内部的值
        x =2;
        y = 3;
        z ="1";
    }

    function bar() external pure returns (uint) {
        // pure 是牛马
        uint xx = 1;
        uint  yy = 2 ;
        return xx + yy;
    }

    function globale()external  view returns(address ,uint,bytes  memory){
        address sender =msg.sender;
        uint bolckNumber = block.number;
        bytes memory content = msg.data;
        return (sender, bolckNumber,content);
    }

    // 计算单元wei
    function weiUnit () external pure returns  (uint){
        assert(1 wei == 1e0);
        assert(1 wei == 1 );
        return 1 wei;
    }

    // 计算单元gwei
    function gweiUnit () external  pure  returns  (uint){
        assert(1 gwei == 1e9);
        assert(1 gwei == 1000000000);
        assert(1 gwei == 10 ** 9);
        return 1 gwei;
    }

    // 计算单元 1 ether
    function etherUnit () external pure  returns (uint){
        assert(1 ether == 1e18);
        assert(1 ether == 10 ** 18);
        assert(1 ether == 1000000000000000000);
        return  1 ether;
    }


    // 时间单元
    function secondUint() external  pure  returns  (uint) {
        assert(1 seconds == 1);
        return 1 seconds;
    }


    // 分钟单元；
    function minutesUnit () external  pure  returns (uint){
        assert(1 minutes == 60 );
        return  1 minutes;
    }

    // 小时单元
    function hoursUnit() external  pure  returns(uint){
        assert(1 hours == 3600 );
        assert(1 hours == 60 minutes);
        return 1 hours;
    }

    // 天单元
    function daysUnit()external pure  returns (uint){
        assert(1 days == 24 hours);
        return  1 days;
    }

    // 周单元
    function weeksUnit()external pure  returns (uint) {
        assert(1 weeks == 7 days);
        return 1 weeks;
    }
}