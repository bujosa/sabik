// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint public x;

    constructor(uint _x) {
        x = _x;
    }

    function increment() external {
        x++;
    }

    function add(uint _y) external view returns (uint sum) {
        return x + _y;
    }
}
