// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract StoreMyMoney
{
address thisContract = address(this);
address owner;
constructor() 
{
    owner = msg.sender;
}
modifier ifThisOwner() 
{
    require(msg.sender == owner);
    _;
}

function myBalance() public view returns(uint)
{
    return address(this).balance;
}

function sendMyMoney() public payable ifThisOwner
{
address payable to = payable(address (owner));
to.transfer(thisContract.balance);
}
receive() external payable { }
}