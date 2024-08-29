// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Fibonacci {
    /*
        This exercise assumes you understand what Fibonacci sequence is.
        1. Function `fibonacci` takes a uint256 as argument and returns nth fibonacci number.
        
        Fibonacci sequence are 0,1,1,2,3,5,8,13,....
        
        calling fibonacci(6) would return 8, because the 6th Fibonacci number is 8.
    */


    // Without reccursion (15429 gas)
    function fibonacci2(uint256 _position) public pure returns (uint256) {
        if(_position == 0) return 0;
        if(_position == 1) return 1;
         else {
            uint256 fibonacciN0 = 0;
            uint256 fibonacciN1 = 1;
            uint256 fibonacciN2;

            for(uint256 i=2; i<= _position; i++) {
                fibonacciN2 = fibonacciN0 + fibonacciN1;
                if(i != _position) {
                    fibonacciN0 = fibonacciN1;
                    fibonacciN1 = fibonacciN2;
                }
            }
            return fibonacciN2;
        }
    }

    // With reccursion : 4248958 gas

    function fibonacci(uint256 _position) public pure returns (uint256) {
        if(_position == 0) return 0;
        if(_position == 1) return 1;
        else {
            return fibonacci(_position - 1) + fibonacci(_position - 2);
        }
    }
}
