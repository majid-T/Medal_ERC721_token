// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./IERC721Metadata.sol";


contract ERC721Token is ERC721Metadata {
    // Implementing metadata interface functions
    string private __name;
    string private __symbol;
    string private __tokenUri;

    constructor(string memory _name, string memory _symbol) public {
        __name = _name;
        __symbol = _symbol;
    }

    function name() public override view returns (string memory) {
        return __name;
    }

    /// @notice An abbreviated name for NFTs in this contract
    function symbol() public override view returns (string memory _symbol) {
        return __symbol;
    }

    /// @notice A distinct Uniform Resource Identifier (URI) for a given asset.
    /// @dev Throws if `_tokenId` is not a valid NFT. URIs are defined in RFC
    ///  3986. The URI may point to a JSON file that conforms to the "ERC721
    ///  Metadata JSON Schema".
    function tokenURI(uint256 _tokenId)
        public
        override
        view
        returns (string memory)
    {
        return __tokenUri; //To Be Developed ............
    }
}
