// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint256[] public evenNumbers;

    function filterEven(uint256[] memory array) public {
        for (uint256 i = 0; i < array.length; i++) {
            if (array[i] % 2 == 0) {
                evenNumbers.push(array[i]);
            }
        }
    }
}
