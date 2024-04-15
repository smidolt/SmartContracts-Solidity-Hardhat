// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract MoneyReciver{
   // uint internal  moneyBalance = 0;
    function receiveFunds () external payable {
       //  address(this).balance; //+ msg.value;
        }
    function getBalance() public view returns(uint) 
        {
        return address(this).balance;
        //return moneyBalance;
        }
    function withdrawFunds (address payable _to) external // we don't need the modifier payable here because we're sending money, not accepting it
    {
        _to.transfer(address(this).balance);
       // moneyBalance = 0;
    }
}