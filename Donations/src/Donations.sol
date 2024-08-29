// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Donations {
    mapping(address => uint256) public amountDonated;

    receive() external payable {
        amountDonated[msg.sender] += msg.value;
    }
}
