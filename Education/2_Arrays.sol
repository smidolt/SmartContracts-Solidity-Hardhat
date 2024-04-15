// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract Mycontract    {
    string[] public Emptyshit; //just empty array
    uint256[][] public array2D = [[1,2,3],[4,2,1]];
    uint256[][] public multyarray;

    constructor() {
        multyarray.push([1, 2, 3]);
        multyarray.push([4, 5, 6]);
        multyarray.push([7, 8, 9]);
    }
    function addValue(string memory _value) public
    {
        Emptyshit.push(_value);
    }
    function readCounter() public view returns(string[] memory) 
    {
        return Emptyshit;
    }

    function valueCounter() public view returns(uint) 
    {
        return Emptyshit.length;
    }
        function readarray2D() public view returns(uint256[][] memory) 
    {
        return array2D; 
    }
        function readmultyarray() public view returns(uint256[][] memory) 
    {
        return multyarray; 
    }
    function addNewList(uint256[] memory _newList) public 
    {
        multyarray.push(_newList);
    }

}