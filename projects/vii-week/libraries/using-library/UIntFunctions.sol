// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library UIntFunctions {
    function isEven(uint256 first) public pure returns (bool) {
        if (first % 2 == 0) {
            return true;
        }

        return false;
    }
}
