// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    struct User {
        uint256 balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() public {
        require(users[msg.sender].balance == 0, "User already exist.");
        users[msg.sender] = User(100, true);
    }

    function transfer(address to, uint256 amount) public {
        require(users[msg.sender].balance >= amount, "Not enough balance.");
        require(users[to].isActive, "Receiver is not active.");
        users[msg.sender].balance -= amount;
        users[to].balance += amount;
    }
}
