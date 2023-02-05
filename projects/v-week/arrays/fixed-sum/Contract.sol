// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function sum(uint256[5] memory arr) public pure returns (uint256 result) {
        for (uint256 i = 0; i < arr.length; i++) {
            result += arr[i];
        }
        return result;
    }
}
