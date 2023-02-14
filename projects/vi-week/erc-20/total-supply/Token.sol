// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Token {
    uint256 public totalSupply;
    string public name = "Vi Week Token";
    string public symbol = "VWT";
    uint8 public decimals = 18;

    mapping(address => uint256) private _balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        totalSupply = 1000 * 10**uint256(decimals);
        _balanceOf[msg.sender] = totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return _balanceOf[_owner];
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(_balanceOf[msg.sender] >= _value, "Insufficient balance");
        _balanceOf[msg.sender] -= _value;
        _balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }
}
