// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


// modifier 重写
contract Super {

    event Log (string name );

    function name() public virtual {
        emit  Log ("hahhah");
    }
}

contract Steven is Super {

    function name() public virtual  override  {
        emit Log(" called steven ");
        super.name();
    }
}

contract Tina is Super {
    function name() public virtual  override  {
        emit Log(" called tina");
        super.name();
    }
}


contract StevenSon is Steven ,Tina{
    function name () public virtual  override (Steven,Tina) {
        super.name();
    }
}

// 这里需要注意的是，如果单纯掉StevenSon的super.name(),那么只会call Tina上面去
// 但是如果Tina 也调用了更上面一层，那么就会存在问题： 会调用到业务不相关的Steven上面去，
// 下面是调用路径，可以尝试一下
/*[
    {
    "from": "0x70727b4fdc75bd2461d1b16d33ad61e5638ff675",
    "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
    "event": "Log",
    "args": {
        "0": " called tina",
        "name": " called tina"
        }
    },
    {
    "from": "0x70727b4fdc75bd2461d1b16d33ad61e5638ff675",
    "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
    "event": "Log",
    "args": {
        "0": " called steven ",
        "name": " called steven "
        }
    },
    {
    "from": "0x70727b4fdc75bd2461d1b16d33ad61e5638ff675",
    "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
    "event": "Log",
        "args": {
        "0": "hahhah",
        "name": "hahhah"
        }
    }
]*/



