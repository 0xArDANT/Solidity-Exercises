// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract SumArray {
    function sumArray(uint256[] calldata arr) public pure returns (uint256) {
        // your code here
        // arr is a list of unsigned integers
        // return the sum of them. If the array
        // is empty, return 0
        if(arr.length == 0) return 0;
        else {
            uint256 sum = 0;
            for(uint256 i = 0; i < arr.length; i++) {
                sum += arr[i];
            }
            return sum;
        }

    }
}
