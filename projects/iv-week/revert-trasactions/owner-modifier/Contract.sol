// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    address owner;
    uint256 configA;
    uint256 configB;
    uint256 configC;

    constructor() {
        owner = msg.sender;
    }

    function setA(uint256 _configA) public onlyOwner {
        configA = _configA;
    }

    function setB(uint256 _configB) public onlyOwner {
        configB = _configB;
    }

    function setC(uint256 _configC) public onlyOwner {
        configC = _configC;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}
