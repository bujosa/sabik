// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract OnOffSwitch {
    // the switch is on if true
    bool private isOn;

    constructor() {
        // we'll default to being on
        isOn = true;
    }

    // a publicly accessible function to "flip" the switch
    function toggle() public returns(bool) {
        // flip isOn from true->false or false->true
        isOn = !isOn;
        // return the new value
        return isOn;
    }
}