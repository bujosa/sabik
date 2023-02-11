// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./BaseContracts.sol";

contract Collectible is Ownable, Transferable {
    uint256 public price;

    function markPrice(uint256 _price) external onlyOwner {
        price = _price;
    }
}
