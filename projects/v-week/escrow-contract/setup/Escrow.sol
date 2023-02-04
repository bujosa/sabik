// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Escrow {
    address public arbiter;
    address public depositor;
    address public beneficiary;

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        depositor = msg.sender;
        beneficiary = _beneficiary;
    }
}
