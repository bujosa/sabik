// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Escrow {
    address public arbiter;
    address public depositor;
    address public beneficiary;
    bool public isApproved = false;

    event Approved(uint256 indexed balance);

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        depositor = msg.sender;
        beneficiary = _beneficiary;
    }

    function approve() external {
        require(msg.sender == arbiter, "You are not the arbiter");
        isApproved = true;
        uint256 balance = address(this).balance;
        (bool success, ) = beneficiary.call{value: balance}("");
        require(success, "Transfer failed");
        emit Approved(balance);
    }
}
