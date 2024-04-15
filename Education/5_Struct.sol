// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract Structures 
{
    struct Payment
    {
        uint amount;
        uint timestamp;
    }
    Payment[] public payments;

    function transaction() public payable 
    {
        Payment memory  payment = Payment(msg.value, block.timestamp);
        payments.push(payment);
    }
    function withdraw(address payable _to) public 
    {   uint totalPayments;
        for (uint i = 0; i < payments.length; i++) 
        {
            totalPayments+= payments[i].amount;
        }
        _to.transfer(totalPayments);
    }
}
