// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;
//50 gwei per 1 gas
contract Opt
{
// uint demo; // 66854 gas 
// uint128 a =1;
// uint128 b = 1;
// uint256 c = 1;// and here just 113298 - 22usdt
uint8 buba  = 1;
}

contract NotOpt
{
    uint buba = 1;
// uint demo = 0; // 69107 gas
// uint128 a = 1;
// uint256 c = 1;
// uint128 b = 1; //IN THIS CASE we spent  135148 gas - 27usdt
}
