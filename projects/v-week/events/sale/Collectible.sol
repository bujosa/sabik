// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address public owner;
    uint256 public salePrice;

    event Deployed(address indexed from);
    event Transfer(address indexed from, address indexed to);
    event ForSale(uint256 price, uint256 timestamp);
    event Purchase(uint256 purchaseAmount, address indexed buyer);

    constructor() {
        owner = msg.sender;
        salePrice = 0;
        emit Deployed(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner.");
        _;
    }

    function transfer(address to) external onlyOwner {
        owner = to;
        emit Transfer(msg.sender, to);
    }

    function markPrice(uint256 price) external onlyOwner {
        require(price > 0, "Price must be greater than 0");
        salePrice = price;
        emit ForSale(price, block.timestamp);
    }

    function purchase() external payable {
        require(salePrice > 0, "This item is not for sale");
        require(msg.value >= salePrice, "Insufficient funds");

        salePrice = 0;
        address lastOwner = owner;
        owner = msg.sender;

        (bool success, ) = lastOwner.call{value: msg.value}("");
        require(success, "Transfer failed.");

        emit Purchase(msg.value, msg.sender);
    }
}
