// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hero {
    Ambush public ambush;

    struct Ambush {
        bool alerted;
        uint256 enemies;
        bool armed;
    }

    uint256 public lastContact;

    function alert(uint256 enemies, bool armed) external {
        ambush = Ambush(true, enemies, armed);
    }

    fallback() external {
        lastContact = block.timestamp;
    }
}
