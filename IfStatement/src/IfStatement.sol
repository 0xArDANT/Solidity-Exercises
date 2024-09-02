// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IfStatement {
    function max(uint256 a, uint256 b) public pure returns (uint256) {
        if(a > b) return a;
        else return b;
    }

    function min(uint256 a, uint256 b) public pure returns (uint256) {
        if(a < b) return a;
        else return b;
    }
}
