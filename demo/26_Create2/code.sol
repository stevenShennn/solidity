/**
 *Submitted for verification at testnet.bscscan.com on 2023-04-04
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;



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

    function createPair2 (address tokenA,address tokenB ) external returns (address pairAddr){
        require(tokenA != tokenB,"Identical_address");
        // 计算盐
        (address token0, address token1 ) = tokenA < tokenB ? (tokenA,tokenB):(tokenB,tokenA);
        bytes32 salt = keccak256(abi.encodePacked(token0,token1));

        Pair pair = new Pair{salt: salt}();
        // 调用新合约的initialize方法
        pairAddr = address(pair);

        allPaires.push(pairAddr);
        getPair[tokenA][tokenB] =pairAddr;
        getPair[tokenB][tokenA] =pairAddr;
    }


    // 提前计算pair合约地址
    function calculateAddr(address tokenA,address  tokenB) public view returns (address perdictedAddress){
        require(tokenA != tokenB,"Identical_addresses");
        (address token0, address token1 ) = tokenA < tokenB ? (tokenA,tokenB):(tokenB,tokenA);
        bytes32 salt = keccak256(abi.encodePacked(token0,token1));

        perdictedAddress =address(uint160(uint(keccak256(abi.encode(
            bytes1(0xff),
            address(this),
            salt,
            keccak256(type(Pair).creationCode)
        )))));
    }
}