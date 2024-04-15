// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract LoopCondition 
{
 uint number;
 uint[] internal newNumber = [1,5,5,4,5,6,7,8,9,0];
 address public owner;
 constructor() 
 {
   owner = msg.sender;
 }


function isYouOwner() public view returns(bool)
{
    return(msg.sender == owner);
} 
function superLoop() public view returns(uint)
{
    uint evenCounter = 0;
    uint oddCounter = 0;
    for (uint i = 0; i < newNumber.length; i++) 
    {
       if(bIsItEvenOrOdd(newNumber[i]) == true) {
        evenCounter ++;
       } 
       else 
       {
        oddCounter++;
       }
    }
    return (evenCounter);
}

 function aCreateNumber(uint _number) public pure returns(string memory)
 {
    if (_number % 2 == 0)  
    {
        return "Even number";
    }
         
    else     
    {
        return "Odd number";
    }
 }
 function bIsItEvenOrOdd (uint _newNumber) public pure returns(bool)
 {
     if (_newNumber % 2 == 0)  
    {
        return true;
    }
         
    else     
    {
        return false;
    }
 }

}