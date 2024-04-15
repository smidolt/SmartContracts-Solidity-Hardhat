// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract MoneyOperations {
    address payable public owner;
    enum Statuses {Vacant, Occupied}
    Statuses public  currentStatus;
    event  Occupy(address _occupant, uint _value);


    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }
    modifier onlyWhileVacant 
    {
        require(currentStatus == Statuses.Vacant, "Currently occupied");
        _;
    }
    modifier costs (uint _amount)
    {
        require(msg.value >= _amount, "Not enough ETH");
         _;
    } 
  function book() public payable onlyWhileVacant costs(1 ether) {
    currentStatus = Statuses.Occupied;
    (bool sent, bytes memory data) = owner.call{value: msg.value}("");
    require(sent, "Failed to send Ether to owner");

    emit Occupy(msg.sender, msg.value);
}



    function receiveFunds () external payable {
       //  address(this).balance; //+ msg.value;
        }
}












//payable modifier allow to RECIVE crypto to his address

// Ether payments
// Modifiers
// Visibility
// Events
// Enums