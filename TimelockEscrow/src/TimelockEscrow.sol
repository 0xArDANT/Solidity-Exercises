// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TimelockEscrow {
    address public seller;
    mapping(address => uint256) public withdrawalTime;
    mapping(address => uint) public amountDeposited;
    /**
     * The goal of this exercise is to create a Time lock escrow.
     * A buyer deposits ether into a contract, and the seller cannot withdraw it until 3 days passes. Before that, the buyer can take it back
     * Assume the owner is the seller
     */

    constructor() {
        seller = msg.sender;
    }

    // creates a buy order between msg.sender and seller
    /**
     * escrows msg.value for 3 days which buyer can withdraw at anytime before 3 days but afterwhich only seller can withdraw
     * should revert if an active escrow still exist or last escrow hasn't been withdrawn
     */
    function createBuyOrder() external payable {
        withdrawalTime[msg.sender] = block.timestamp + 3 days;
        amountDeposited[msg.sender] = msg.value;
    }

    /**
     * allows seller to withdraw after 3 days of the escrow with @param buyer has passed
     */
    function sellerWithdraw(address buyer) external {
        require(block.timestamp >= withdrawalTime[buyer], "The 3 days freezing period hasn't ended");
        payable(seller).transfer(amountDeposited[buyer]);
    }

    /**
     * allowa buyer to withdraw at anytime before the end of the escrow (3 days)
     */
    function buyerWithdraw() external {
        require(block.timestamp < withdrawalTime[msg.sender], "It's too late to withdraw !");
        payable(msg.sender).transfer(amountDeposited[msg.sender]);
        amountDeposited[msg.sender] = 0;
    }

    // returns the escrowed amount of @param buyer
    function buyerDeposit(address buyer) external view returns (uint256) {
        return amountDeposited[buyer];
    }
}
