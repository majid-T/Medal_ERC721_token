// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./IERC721Metadata.sol";
import "./IERC721.sol";


interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * [EIP section](https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified)
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}


contract ERC721Token is IERC721Metadata, IERC165 {
    // Implementing IERC721Metadata interface functions
    string private __name;
    string private __symbol;
    string private __tokenUri;

    //Register below on constrtuctor
    //   165 funct --> bytes4(keccak256('supportsInterface(bytes4)')) == 0x01ffc9a7
    bytes4 private constant _INTERFACE_ID_ERC165 = 0x01ffc9a7;

    constructor(string memory _name, string memory _symbol) public {
        __name = _name;
        __symbol = _symbol;
        _registerInterface(_INTERFACE_ID_ERC165);
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

    // Implementing IERC165 interface functions
    mapping(bytes4 => bool) private _supportedInterfaces;

    function _registerInterface(bytes4 interfaceId) internal {
        require(interfaceId != 0xffffffff, "ERC165: invalid interface id");
        _supportedInterfaces[interfaceId] = true;
    }

    function supportsInterface(bytes4 interfaceId)
        public
        override
        view
        returns (bool)
    {
        return _supportedInterfaces[interfaceId];
    }
}
