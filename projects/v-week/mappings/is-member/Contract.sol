// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    mapping(address => bool) public members;

    function addMember(address _member) public {
        members[_member] = true;
    }

    function isMember(address _member) public view returns (bool) {
        return members[_member];
    }
}
