// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    address[] members;
    address owner;

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

    event ProposalCreated(uint256);
    event VoteCast(uint256, address);

    constructor(address[] memory _members) {
        members = _members;
        owner = msg.sender;
    }

    modifier onlyMembers() {
        bool onlyMember = false;
        if (owner != msg.sender) {
            for (uint256 i = 0; i < members.length; i++) {
                if (msg.sender == members[i]) {
                    onlyMember = true;
                    break;
                }
            }
            require(onlyMember, "Only member can use this functions");
        }
        _;
    }

    function newProposal(address target, bytes memory data)
        external
        onlyMembers
    {
        Proposal memory myStruct = Proposal(target, data, 0, 0);
        proposals.push(myStruct);
        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint256 proposalId, bool supportProposal)
        external
        onlyMembers
    {
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

        if (proposal.yesCount >= 10) {
            (bool success, ) = proposal.target.call(proposal.data);
            require(success);
        }
        emit VoteCast(proposalId, msg.sender);
    }
}
