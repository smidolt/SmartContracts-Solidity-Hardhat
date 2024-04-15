// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract Parent 
{
    uint public number;
    constructor(uint _number) 
    {
        number = _number;
    }
//     function print() public pure returns(uint)
// {
//     return 42;
// }

}

contract  ChildA is Parent //IF I use more parents I should use the most high-level one available FROM TOPto BOTTOM
{
    uint public childValue;
    constructor (uint _input) Parent(_input){
childValue = _input;
    }
}

