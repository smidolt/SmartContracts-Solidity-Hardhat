// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract MoneyOperations {
    address payable public owner;
    address payable public otherGuy;
    uint256 otherGuyMONEY;

    struct SenderAddress {
        uint amount;
        address payable addressParam;
    }

    constructor() {
        owner = payable(msg.sender);
        otherGuyMONEY = otherGuy.balance / 1 ether;
    }

    function howMuch(address _addr) public view returns (uint256) {
        return _addr.balance / 1 ether;
    }

    function trans(address payable _addr) public payable {
        _addr.transfer(msg.value);
    }

    function addAddressBook(uint amount, address payable addressParam) public payable {
        addressParam.transfer(amount);
    }
    receive () external payable {
       //  address(this).balance; //+ msg.value;
        }
}












//payable modifier allow to RECIVE crypto to his address

// Ether payments
// Modifiers
// Visibility
// Events
// Enums