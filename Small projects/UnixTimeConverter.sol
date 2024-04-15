// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;
contract TimeConverter 
{

//Just input your timestamp in getDateTime function 
    function getDateTime(uint timestamp) public pure returns (string memory) {
        return timestampToString(timestamp);
    }

    function timestampToString(uint timestamp) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    formatTime(getHour(timestamp)),
                    ":",
                    formatTime(getMinute(timestamp)),
                    " ",
                    formatTime(getDay(timestamp)),
                    "/",
                    formatTime(getMonth(timestamp)),
                    "/",
                    uint2str(getYear(timestamp))
                )
            );
    }

    function getYear(uint timestamp) internal pure returns (uint) {
        return (timestamp / 31556926) + 1970; // 365.2425 days in a year (including leap years)
    }

    function getMonth(uint timestamp) internal pure returns (uint) {
        uint secondsInMonth = 2629743; // average seconds in a month
        return ((timestamp % 31556926) / secondsInMonth) + 1;
    }

    function getDay(uint timestamp) internal pure returns (uint) {
        uint secondsInDay = 86400; // 24 hours * 60 minutes * 60 seconds
        return ((timestamp % 31556926) % secondsInDay) / 86400;
    }

    function getHour(uint timestamp) internal pure returns (uint) {
        uint secondsInHour = 3600; // 60 minutes * 60 seconds
        return ((timestamp % 31556926) % secondsInHour) / 3600;
    }

    function getMinute(uint timestamp) internal pure returns (uint) {
        uint secondsInMinute = 60; // 60 seconds
        return ((timestamp % 31556926) % secondsInMinute) / 60;
    }

    function formatTime(uint time) internal pure returns (string memory) {
        if (time < 10) {
            return string(abi.encodePacked("0", uint2str(time)));
        }
        return uint2str(time);
    }

    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }

    
}