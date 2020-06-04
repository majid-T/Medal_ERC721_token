// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./ERC721Token.sol";


contract Medal is ERC721Token {
    constructor() public ERC721Token("GoldMedal", "GTC") {}
}
