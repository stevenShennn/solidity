/**
 *Submitted for verification at testnet.bscscan.com on 2023-04-04
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


// 工厂模式创建具体的合约
contract Pair {
    address public factory ;
    address public token0 ;
    address public token1 ;

    constructor ()payable {
        factory = msg.sender;
    }


    function initialize(address _token0,address _token1 )external {
        require(msg.sender ==factory,"uniswapV2:forbiden");
        token0 = _token0;
        token1 = _token1;
    }
}


contract PairFactory{
    mapping (address => mapping (address=> address)) public getPair;
    address [] public allPaires;// 保存所有Paire地址

    function createPair(address tokenA,address tokenB) external returns (address pairAddr){
        Pair pair = new Pair();
        pair.initialize(tokenA, tokenB);
        pairAddr =address(pair);
        allPaires.push(pairAddr);
        getPair[tokenA][tokenB] =pairAddr;
        getPair[tokenB][tokenA] =pairAddr;
    }
}