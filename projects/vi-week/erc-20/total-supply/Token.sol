// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Token {
    uint256 public totalSupply;
    string public name = "Vi Week Token";
    string public symbol = "VWT";
    uint8 public decimals = 18;

    mapping(address => uint256) private _balanceOf;

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return _balanceOf[_owner];
    }
}
