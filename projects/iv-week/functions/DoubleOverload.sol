// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function double(uint256 x) external pure returns (uint256 sum) {
        sum = 2 * x;
    }

    function double(uint256 x, uint256 y)
        external
        pure
        returns (uint256 xx, uint256 yy)
    {
        xx = 2 * x;
        yy = 2 * y;
    }
}
