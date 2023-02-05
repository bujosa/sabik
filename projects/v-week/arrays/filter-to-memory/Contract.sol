// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function filterEven(uint256[] memory array)
        public
        pure
        returns (uint256[] memory)
    {
        uint256[] memory evenNumbers = new uint256[](array.length);
        uint256 count = 0;
        for (uint256 i = 0; i < array.length; i++) {
            if (array[i] % 2 == 0) {
                evenNumbers[count] = array[i];
                count++;
            }
        }
        uint256[] memory result = new uint256[](count);
        for (uint256 i = 0; i < count; i++) {
            result[i] = evenNumbers[i];
        }
        return result;
    }
}
