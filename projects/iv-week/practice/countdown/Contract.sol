// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    // Add an external function to the contract called tick.
    // After calling tick 10 times, it should selfdestruct the contract.
    uint256 public counter = 0;

    function tick() external {
        counter++;
        if (counter == 10) {
            selfdestruct(payable(msg.sender));
        }
    }
}
