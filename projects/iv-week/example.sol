// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MyContract {
    address public owner;
    bool public isHappy;
    uint public x = 10;
    int public y = -50;

    constructor(address _owner, bool _isHappy) {
        owner = _owner;
        isHappy = _isHappy;
    }
}

contract Contract {
    bool public value = true;
    int public a = 10;
    string public word = "Hello World";
}