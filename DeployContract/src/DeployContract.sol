// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Deployer {
    /*
        This exercise assumes you know how to deploy a contract.
        1. Create an empty contract.
        2. Deploy the contract and return the address in `deployContract` function.
    */
    DeployedContract deployed;

    function deployContract() public returns (address) {
        deployed = new DeployedContract();
        return address(deployed);

    }
}

contract DeployedContract {}
