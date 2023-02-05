// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    enum Choices {
        Yes,
        No
    }

    // TODO: create a vote struct and a public state variable
    struct Vote {
        address voter;
        Choices choice;
    }

    Vote public vote;

    function createVote(Choices choice) external {
        vote.voter = msg.sender;
        vote.choice = choice;
    }
}
