// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address public owner = msg.sender;
    event Deployed(address indexed from);
    event Transfer(address indexed from, address indexed to);
    event ForSale(uint256 price, uint256 timestamp);

    constructor() {
        owner = msg.sender;
        emit Deployed(msg.sender);
    }

    function transfer(address to) external {
        require(msg.sender == owner, "You are not the owner");
        owner = to;
        emit Transfer(msg.sender, to);
    }

    function markPrice(uint256 price) external {
        require(msg.sender == owner, "You are not the owner");
        emit ForSale(price, block.timestamp);
    }
}
