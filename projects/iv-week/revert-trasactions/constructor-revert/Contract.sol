// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    constructor() payable {
        require(msg.value >= 1 ether, "Want More Ether!");
    }
}
