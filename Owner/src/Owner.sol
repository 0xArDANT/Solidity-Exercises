// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OnlyOwner {
    /*
        This exercise assumes you know how restrict a function call to an address.
        1. Restrict `updateMagicNumber` function call to only the address
           passed in the constructor.
    */

    address owner;
    uint256 public magicNumber;

    modifier onlyOwner(){
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(address _owner, uint256 _magicNumber) {
        owner = _owner;
        magicNumber = _magicNumber;
    }

    function updateMagicNumber(uint256 _number) public onlyOwner {
        magicNumber = _number;
    }
}
