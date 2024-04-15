// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract Transfers 
{
    struct Transfer
    {
        uint ammount;
        uint timestamp;
        address sender;
    }

Transfer[] transfers;
    address owner;
    uint8 maxTransfer;
    uint8 currentTransfers;

constructor(uint8 _maxTransfer)
{
    owner = msg.sender;
    maxTransfer = _maxTransfer;
}
function getTransfer(uint _index)public view returns(Transfer memory)
{
    require(_index < transfers.length, "Cannot find this transfer.");
    return transfers[_index];
}
modifier requireOwner() 
{
    require(owner == msg.sender, "Not an owner");
    _;
}
receive() external payable 
{
if(currentTransfers >= maxTransfer) 
{
    revert("Cannot accept more transfers.");
}
Transfer memory newTransfer = Transfer(msg.value, block.timestamp, msg.sender);
transfers.push(newTransfer);
currentTransfers++;
}
function myBalance() public view returns(uint)
{
    return address(this).balance;
}
}
//0x8a791620dd6260079bf849dc5567adc3f2fdc318