// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract FirstTransaction {
    mapping  (address => bool) buyers;
    uint64 public price = 2 ether;
    address public owner;
    address public shopAddress;
    bool fullyPaid; //default false

    constructor() {
        owner = msg.sender; //It helps us to know our own address - for example metamask address
        shopAddress = address(this); //It helps us to know our contract address
    }
    function add_buyer(address _address) public 
    { 
        require(owner == msg.sender, "You are not a owner");
        buyers[_address] = true;
        
    }
    function getbuyers(address _address) public view returns(bool) {
        require(owner == msg.sender, "You are not a owner"); 
        return(buyers[_address]);       
    }
    function get_balance() public view returns (uint){
        return shopAddress.balance;
    }
    function withdrawall() public  
    {
        require(owner == msg.sender && fullyPaid && shopAddress.balance >0, "Rejected");
        address payable receiver = payable(msg. sender);
        receiver.transfer (shopAddress.balance);    
    }
    receive() external payable {
        require(buyers[msg.sender] && msg.value <= price && !fullyPaid, "Rejected");
        if (shopAddress.balance == price) {
            fullyPaid = true;
        }
     }
}


