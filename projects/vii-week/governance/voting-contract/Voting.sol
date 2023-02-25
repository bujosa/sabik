// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint256 yesCount;
        uint256 noCount;
    }

    struct Vote {
        bool alreadyVote;
        bool status;
    }

    Proposal[] public proposals;
    mapping(uint256 => mapping(address => Vote)) private registerVotes;

    function newProposal(address target, bytes memory data) external {
        Proposal memory myStruct = Proposal(target, data, 0, 0);
        proposals.push(myStruct);
    }

    function castVote(uint256 proposalId, bool supportProposal) external {
        Proposal storage proposal = proposals[proposalId];
        Vote storage vote = registerVotes[proposalId][msg.sender];

        if (vote.alreadyVote) {
            if (supportProposal) {
                if (!vote.status) {
                    vote.status = !vote.status;
                    proposal.noCount--;
                    proposal.yesCount++;
                }
            } else {
                if (vote.status) {
                    vote.status = !vote.status;
                    proposal.noCount++;
                    proposal.yesCount--;
                }
            }
        } else {
            if (supportProposal) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }

            registerVotes[proposalId][msg.sender] = Vote(true, supportProposal);
        }
    }
}
