// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface Enemy {
    function takeAttack(Hero.AttackTypes attackType) external;
}

abstract contract Hero {
    uint256 public health;

    constructor(uint256 _health) {
        health = _health;
    }

    function takeDamage(uint256 damage) external {
        health -= damage;
    }

    enum AttackTypes {
        Brawl,
        Spell
    }

    function attack(address enemy) public virtual;
}
