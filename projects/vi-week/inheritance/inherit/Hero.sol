// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface Enemy {
    function takeAttack(Hero.AttackTypes attackType) external;
}

contract Hero {
    uint256 public health;
    uint256 public energy = 10;

    constructor(uint256 _health) {
        health = _health;
    }

    enum AttackTypes {
        Brawl,
        Spell
    }

    function attack(address) public virtual {
        energy--;
    }
}
