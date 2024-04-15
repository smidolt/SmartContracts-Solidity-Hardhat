// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract SmallShop
{   address  Owner;
    address public myContractAddress  = address(this);
    mapping(address => uint) public payments;
    modifier ifThisOwner() 
    {
        require(msg.sender == Owner);
        _;
    }

    constructor() 
    {
        Owner = msg.sender;
    }

    function payForItem() external payable 
    { 
        payments[msg.sender] = msg.value;
    }

    function withdraw() public ifThisOwner
    {
        address payable _to = payable(Owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
    }
    function myBalance() public view returns(uint)
    {
        
    }
    receive() external payable {
        
     }
}