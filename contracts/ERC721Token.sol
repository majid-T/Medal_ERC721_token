// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./IERC721Metadata.sol";
import "./IERC721.sol";
import "./SafeMath.sol";


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


contract ERC721Token is IERC721Metadata, IERC165, IERC721 {
    using SafeMath for uint256;

    // Implementing IERC721Metadata interface functions
    string private __name;
    string private __symbol;
    string private __tokenUri;

    // Mapping for stroing interface ids of supoorted interfaces
    mapping(bytes4 => bool) private _supportedInterfaces;

    //Register below on constrtuctor
    //   165 funct --> bytes4(keccak256('supportsInterface(bytes4)')) == 0x01ffc9a7
    bytes4 private constant _INTERFACE_ID_ERC165 = 0x01ffc9a7;
    /*
     *     bytes4(keccak256('balanceOf(address)')) == 0x70a08231
     *     bytes4(keccak256('ownerOf(uint256)')) == 0x6352211e
     *     bytes4(keccak256('approve(address,uint256)')) == 0x095ea7b3
     *     bytes4(keccak256('getApproved(uint256)')) == 0x081812fc
     *     bytes4(keccak256('setApprovalForAll(address,bool)')) == 0xa22cb465
     *     bytes4(keccak256('isApprovedForAll(address,address)')) == 0xe985e9c
     *     bytes4(keccak256('transferFrom(address,address,uint256)')) == 0x23b872dd
     *     bytes4(keccak256('safeTransferFrom(address,address,uint256)')) == 0x42842e0e
     *     bytes4(keccak256('safeTransferFrom(address,address,uint256,bytes)')) == 0xb88d4fde
     *
     *     => 0x70a08231 ^ 0x6352211e ^ 0x095ea7b3 ^ 0x081812fc ^
     *        0xa22cb465 ^ 0xe985e9c ^ 0x23b872dd ^ 0x42842e0e ^ 0xb88d4fde == 0x80ac58cd
     */
    bytes4 private constant _INTERFACE_ID_ERC721 = 0x80ac58cd;

    // Mapping from token ID to owner
    mapping(uint256 => address) private _tokenOwner;

    // Mapping from token ID to approved address
    mapping(uint256 => address) private _tokenApprovals;

    // Mapping from owner to number of owned token
    mapping(address => uint256) private _ownedTokensCount;

    // Mapping from owner to operator approvals
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    constructor(string memory _name, string memory _symbol) public {
        __name = _name;
        __symbol = _symbol;
        _registerInterface(_INTERFACE_ID_ERC165);
        _registerInterface(_INTERFACE_ID_ERC721);
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

    // Implementing IERC721 interface functions
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );
    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    function balanceOf(address owner)
        public
        override
        view
        returns (uint256 balance)
    {
        return 1;
    }

    function ownerOf(uint256 tokenId)
        public
        override
        view
        returns (address owner)
    {
        return address(this);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public override payable {}

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public override payable {}

    function approve(address to, uint256 tokenId) public override payable {}

    function getApproved(uint256 tokenId)
        public
        override
        view
        returns (address operator)
    {
        return address(this);
    }

    function setApprovalForAll(address operator, bool _approved)
        public
        override
    {}

    function isApprovedForAll(address owner, address operator)
        public
        override
        view
        returns (bool)
    {
        return true;
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) public override payable {}
}
