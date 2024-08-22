// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256)
     * - balanceOf(address )
     */

    mapping(address => uint256) balance;
    mapping(address => uint256) userLastDepositTime;

    function balanceOf(address user) public view returns (uint256) {
        return balance[user];
    }

    function depositEther() public payable {
        balance[msg.sender] += msg.value;
        userLastDepositTime[msg.sender] = block.timestamp;
    }

    function withdrawEther(uint256 amount) external {
        require(block.timestamp >= userLastDepositTime[msg.sender] + 1 weeks, "You can only withdraw after a week");
        require(amount <= balance[msg.sender], "You don't have enough funds");
        payable(msg.sender).transfer(amount);
        balance[msg.sender] -= amount;
    }
    
    receive() external payable {
        depositEther();
    }
    
    fallback() external payable {
    	depositEther();
    }
}
