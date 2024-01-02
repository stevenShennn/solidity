// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


// 1. 通过文件引入
import './_Owner.sol';

// 2. 引入文件中特定合约
import  {Owner} from './_Owner.sol';

// 3. 通过网址引入
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol';

// 4. 引用openzepplin 合约
//import '@openzeppelin/contracts/access/Ownable.sol';

contract Import {
    // 成功导入Address库
    using Address for address;
    // 声明yeye变量
    Owner owner = new Owner();

    // 测试是否能调用yeye的函数
    function test() external{
        owner.getOwner();
    }
}