// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract SelfDestroyer {
    /* This exercise assumes you know the selfdestruct function works.
        1. The contract has some ether in it, 
        destroy the contract and send all ether to an address 
        2. The name of the function must be `destroy`,
        that takes a non-payable address input
    */

    constructor() payable {}

    function destroy(address taker) external {

        //this optcode has been deprecated, it doesn't destroy the contract unless 
        // it's called in the same transaction as the contract creation
        selfdestruct(payable(taker));
    }

    function getBalance() public view returns (uint256 balance) {
        balance = address(this).balance;
    }
}
