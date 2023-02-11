// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hero {
    uint256 public health;

    constructor(uint256 _health) {
        health = _health;
    }

    function takeDamage(uint256 damage) external {
        health -= damage;
    }
}
