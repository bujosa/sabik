// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Prime {
    function dividesEvenly(uint256 first, uint256 second)
        public
        pure
        returns (bool)
    {
        if (first % second == 0) {
            return true;
        }

        return false;
    }
}
