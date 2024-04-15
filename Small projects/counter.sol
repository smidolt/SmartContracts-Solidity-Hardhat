// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.25;
contract Counter 
{
  uint public myNum;
  address public owner;
  modifier onlyOwner()
  {
    require(owner == msg.sender, "not an owner");
    _;
  }
  constructor(uint _initialNumber) 
  {
  owner = msg.sender;
  myNum = _initialNumber;
  }

function incrementing() external onlyOwner
{
  myNum++;
}
receive() external payable
{

}
}
