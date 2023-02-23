// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./UIntFunctions.sol";

contract Game {
    uint256 public participants;
    bool public allowTeams;

    constructor(uint256 _x) {
        participants = _x;

        allowTeams = UIntFunctions.isEven(_x);
    }
}
