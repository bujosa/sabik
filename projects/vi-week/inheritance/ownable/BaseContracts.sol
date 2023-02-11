// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}

contract Transferable is Ownable {
    function transfer(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}
