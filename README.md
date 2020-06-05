# Medal_ERC721_token

A simple ERC721 token model for tokenizing athletes medals.

Athletes and champions who wo different competations can tokenize thier mdeals usinf Medal ERC721 token.

Configured to run on ganache GUI component port 7545. If using ganache CLI change port to 8545 on truffle-config.js

# Functions and Events

from ERC721:
event Transfer(address indexed \_from, address indexed \_to, uint256 indexed \_tokenId);
event Approval(address indexed \_owner, address indexed \_approved, uint256 indexed \_tokenId);
event ApprovalForAll(address indexed \_owner, address indexed \_operator, bool \_approved);

    function balanceOf(address _owner) external view returns (uint256);
    function ownerOf(uint256 _tokenId) external view returns (address);
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable;
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable;
    function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
    function approve(address _approved, uint256 _tokenId) external payable;
    function setApprovalForAll(address _operator, bool _approved) external;
    function getApproved(uint256 _tokenId) external view returns (address);
    function isApprovedForAll(address _owner, address _operator) external view returns (bool);

From ERC165:
function supportsInterface(bytes4 interfaceID) external view returns (bool);
