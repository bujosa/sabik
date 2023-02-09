// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint256 public required;
    mapping(uint256 => Transaction) public transactions;
    uint256 public transactionCount;
    mapping(uint256 => mapping(address => bool)) public confirmations;

    struct Transaction {
        address to;
        uint256 value;
        bool executed;
    }

    modifier onlyOwners() {
        bool isOwner = false;
        for (uint256 i = 0; i < owners.length; i++) {
            if (owners[i] == msg.sender) {
                isOwner = true;
            }
        }
        require(isOwner, "Only owners can call this function");
        _;
    }

    constructor(address[] memory _owners, uint256 _required) {
        owners = _owners;
        required = _required;

        // Check if the number of owners is less than the required number of signatures
        require(owners.length >= required, "Not enough owners");
        require(owners.length > 0, "No owners");
        require(required > 0, "No required signatures");
    }

    function addTransaction(address _to, uint256 _value)
        public
        returns (uint256)
    {
        transactions[transactionCount] = Transaction(_to, _value, false);
        transactionCount++;
        return transactionCount - 1;
    }

    function confirmTransaction(uint256 _transactionId) public onlyOwners {
        require(
            confirmations[_transactionId][msg.sender] == false,
            "Already confirmed"
        );
        confirmations[_transactionId][msg.sender] = true;
    }

    function getConfirmationsCount(uint256 _transactionId)
        public
        view
        returns (uint256)
    {
        uint256 count = 0;
        for (uint256 i = 0; i < owners.length; i++) {
            if (confirmations[_transactionId][owners[i]]) {
                count++;
            }
        }
        return count;
    }
}
