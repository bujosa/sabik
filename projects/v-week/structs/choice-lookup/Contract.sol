// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    enum Choices {
        Yes,
        No
    }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function createVote(Choices choice) external {
        votes.push(Vote(choice, msg.sender));
    }

    function hasVoted(address voter) external view returns (bool) {
        for (uint256 i = 0; i < votes.length; i++) {
            if (votes[i].voter == voter) {
                return true;
            }
        }
        return false;
    }

    function findChoice(address voter) external view returns (Choices) {
        for (uint256 i = 0; i < votes.length; i++) {
            if (votes[i].voter == voter) {
                return votes[i].choice;
            }
        }
        revert("Voter has not voted yet");
    }
}
