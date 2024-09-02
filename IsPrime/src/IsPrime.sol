// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IsPrime {
    /**
     * The goal of this exercise is to return if "number" is prime or not (true or false)
     */
    function isPrime(uint256 number) public pure returns (bool) {
        require(number >= 0, "The number should be greater than 0");
        if(number == 0 || number == 1) return false;
        if(number == 2) return true;
        if(number % 2 == 0) return false;
        else {
            for(uint i = 3; i * i <= number; i+= 2) {
                if(number % i == 0) return false;
            }
            return true;
        }
    }
}
