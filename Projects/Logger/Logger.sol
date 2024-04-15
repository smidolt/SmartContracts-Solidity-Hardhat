// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Logger
{
    mapping(address => uint[]) payments;
    function log(address _from, uint _howMuch)  public 
    {
        require(_from != address(0), "zero address");
        payments[_from].push(_howMuch);
    }
    function getEntry (address _address, uint _index) public view returns(uint)
    {
        return payments[_address][_index];
    }

}