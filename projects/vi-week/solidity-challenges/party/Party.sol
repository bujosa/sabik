// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
    uint256 public amount;
    uint256 public poolFunds;
    address[] public guests;

    constructor(uint256 _amount) {
        amount = _amount;
    }

    modifier oneGuestPerAddress() {
        for (uint256 i = 0; i < guests.length; i++) {
            require(guests[i] != msg.sender, "You can only RSVP once");
        }
        _;
    }

    function rsvp() public payable oneGuestPerAddress {
        require(msg.value == amount, "You must pay the right amount");
        poolFunds += msg.value;
        guests.push(msg.sender);
    }

    function payBill(address venue, uint256 totalCost) public {
        require(poolFunds >= totalCost, "Not enough funds in the pool");
        payable(venue).transfer(totalCost);
        poolFunds -= totalCost;
        uint256 amountPerGuest = poolFunds / guests.length;

        for (uint256 i = 0; i < guests.length; i++) {
            payable(guests[i]).transfer(amountPerGuest);
            poolFunds -= amountPerGuest;
        }
    }
}
