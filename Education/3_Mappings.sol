// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;
    contract MyContract    
    {
        mapping (uint => address) public myMapping;
        mapping (uint => AddressBook) public bookAddress;
        mapping (address => mapping (uint => AddressBook) ) public myLibrary;
        struct AddressBook 
        {
            string ownerName;
            address addressParam;
        }
        constructor() 
        {   
            myMapping[0] =  0xdD870fA1b7C4700F2BD7f44238821C26f7392148;
            myMapping[1] =  0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
            myMapping[2] =  0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
            myMapping[3] =  0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
            myMapping[4] =  0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
        }

        function addAddressBook(uint _id, string memory _ownerName, address _addressParam) public 
        {
            bookAddress[_id] = AddressBook(_ownerName, _addressParam);
        }

        function addMyboook(uint _id, string memory _ownerName, address _addressParam) public 
        {
            myLibrary[msg.sender][_id] = AddressBook(_ownerName, _addressParam);
        }
    }