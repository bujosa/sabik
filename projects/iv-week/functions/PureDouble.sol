// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function double(uint256 x) external pure returns (uint256 sum) {
        sum = 2 * x;
    }
}
