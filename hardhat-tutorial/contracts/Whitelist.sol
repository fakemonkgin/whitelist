// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;
    mapping(address => bool) public whitelistedAddresses;
    uint8 public numAddressesWhitelisted;

    //when deployed, _maxWhitelistedAddresses will be set in deploy.js
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    } 

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Already claimed a NFT");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Claim limit reached");

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
    