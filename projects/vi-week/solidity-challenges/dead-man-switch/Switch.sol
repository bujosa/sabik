// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Switch {
    address private owner;
    address private recipient;
    uint256 private lastTime;

    constructor(address _recipient) payable {
        owner = msg.sender;
        recipient = _recipient;
        lastTime = block.timestamp;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function withdraw() external {
        require(
            block.timestamp - lastTime > 52 weeks,
            "You can't withdraw yet"
        );
        payable(recipient).transfer(address(this).balance);
    }

    function ping() external onlyOwner {
        lastTime = block.timestamp;
    }
}
