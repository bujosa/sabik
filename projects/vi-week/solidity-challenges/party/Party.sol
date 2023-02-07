// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
    uint256 public amount;
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
        guests.push(msg.sender);
    }
}
