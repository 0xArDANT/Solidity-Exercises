// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract ListOfNumbers {
    uint256[] private arr;

    /// let caller append @param number to the array "arr"
    function appendToArray(uint256 number) public {
        arr.push(number);
    }

    /// return arr
    function getArray() public view returns (uint256[] memory) {
        return arr;
    }
}
