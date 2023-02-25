// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint256 yesCount;
        uint256 noCount;
    }

    Proposal[] public proposals;

    function newProposal(address target, bytes memory data) external {
        Proposal memory myStruct = Proposal(target, data, 0, 0);
        proposals.push(myStruct);
    }

    function castVote(uint256 proposalId, bool supportProposal) external {
        if (supportProposal) {
            proposals[proposalId].yesCount += 1;
        } else {
            proposals[proposalId].noCount += 1;
        }
    }
}
