// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
    uint256 private rsvpAmount;
    address[] private guests;

    constructor(uint256 _amount) {
        rsvpAmount = _amount;
    }

    modifier oneGuestPerAddress() {
        for (uint256 i = 0; i < guests.length; i++) {
            require(guests[i] != msg.sender, "You can only RSVP once");
        }
        _;
    }

    function rsvp() external payable oneGuestPerAddress {
        require(msg.value == rsvpAmount, "You must pay the right amount");
        guests.push(msg.sender);
    }

    function payBill(address venue, uint256 totalCost) external {
        uint256 poolFunds = address(this).balance;

        require(poolFunds >= totalCost, "Not enough funds in the pool");

        payable(venue).transfer(totalCost);
        poolFunds -= totalCost;

        uint256 individualAmount = poolFunds / guests.length;

        for (uint256 i = 0; i < guests.length; i++) {
            payable(guests[i]).transfer(individualAmount);
            poolFunds -= individualAmount;
        }
    }
}
