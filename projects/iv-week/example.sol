// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

address owner;
bool isHappy;

contract MyContract {
    constructor(address _owner, bool _isHappy) {
        owner = _owner;
        isHappy = _isHappy;
    }
}