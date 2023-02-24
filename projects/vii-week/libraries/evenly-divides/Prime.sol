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

    function isPrime(uint256 first) public pure returns (bool) {
        if (first == 1) {
            return false;
        }

        if (first == 2 || first == 3) {
            return true;
        }

        for (uint256 x = 2; x <= first / 2; x++) {
            if (dividesEvenly(first, x)) {
                return false;
            }
        }

        return true;
    }
}
