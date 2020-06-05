const BigNumber = require("bignumber.js");
const truffleAssert = require("truffle-assertions");

const Medal = artifacts.require("./Medal.sol");

contract("Medal", (accounts) => {
  let contract;
  const idERC165 = "0x01ffc9a7";
  const idERC721 = "0x80ac58cd";
  const idERC721Meta = "0x5b5e139f";
  const tokenName = "GoldMedal";
  const tokenSymbol = "GTC";
  const addressZero = "0x0000000000000000000000000000000000000000";
  const deployerAdd = accounts[0];
  const tokenId_1 = 1111;
  const tokenId_2 = 2222;

  before(() => {
    return Medal.deployed().then((contractInstance) => {
      contract = contractInstance;
    });
  });

  describe("A.deployment", async () => {
    it("1.Should deploy successfully", async () => {
      const address = contract.address;
      console.log(`\tDeployed with address of ${address}`);
      assert.notEqual(address, 0x0);
      assert.notEqual(address, "");
      assert.notEqual(address, null);
      assert.notEqual(address, undefined);
    });

    it("2.Supports ERC721MetaData funcs supportsInterface", async () => {
      const erc721MetaComplied = await contract.supportsInterface.call(
        idERC721Meta
      );
      assert.equal(
        erc721MetaComplied,
        true,
        `Returned ${erc721MetaComplied} for ${idERC721Meta}`
      );
    });

    it("3.should have a name and equal to what received by constructor", async () => {
      const name = await contract.name();
      assert.equal(name, tokenName);
    });

    it("4.Should have a symbol and equal to what received by constructor", async () => {
      const symbol = await contract.symbol();
      assert.equal(symbol, tokenSymbol);
    });
  });

  describe("B.ERC165 checks", async () => {
    it("1.Supports ERC165 func supportsInterface", async () => {
      const erc165Complied = await contract.supportsInterface.call(idERC165);
      assert.equal(
        erc165Complied,
        true,
        `Returned ${erc165Complied} for ${idERC165}`
      );
    });
  });

  describe("C.ERC721 checks", async () => {
    it("1.Supports ERC721 functions", async () => {
      const erc721Complied = await contract.supportsInterface.call(idERC721);
      assert.equal(
        erc721Complied,
        true,
        `Returned ${erc721Complied} for ${idERC721}`
      );
    });
  });

  describe("D.Minitng", async () => {
    it("1.Deployer should have zero balance before mint", async () => {
      const deployerBalance = await contract.balanceOf.call(deployerAdd);
      assert.equal(
        deployerBalance,
        0,
        `Returned ${deployerBalance} for balance of ${deployerAdd}`
      );
    });

    it("2.Deployer should be able to mint one token", async () => {
      const mintTx = await contract._mint(deployerAdd, tokenId_1);

      // truffleAssert.eventEmitted(
      //   mintTx,
      //   "Transfer",
      //   (obj) => {
      //     return (
      //       obj.from === addressZero &&
      //       obj.to === deployerAdd &&
      //       obj.tokeId === tokenId_1
      //     );
      //   },
      //   `Error on emitting event on tx ${mintTx}`
      // );
      const deployerBalanceAfter = await contract.balanceOf.call(deployerAdd);

      assert.equal(
        deployerBalanceAfter,
        1,
        `Returned ${deployerBalanceAfter} for balance of ${deployerAdd}`
      );
    });
  });
});
// event Transfer( address indexed from, address indexed to, uint256 indexed tokenId);
// event Approval( address indexed owner, address indexed approved, uint256 indexed tokenId);
// event ApprovalForAll(address indexed owner,address indexed operator,bool approved);

// function balanceOf(address _owner) external view returns(uint256);
// function ownerOf(uint256 _tokenId) external view returns(address);
// function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable;
// function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable;
// function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
// function approve(address _approved, uint256 _tokenId) external payable;
// function setApprovalForAll(address _operator, bool _approved) external;
// function getApproved(uint256 _tokenId) external view returns(address);
// function isApprovedForAll(address _owner, address _operator) external view returns(bool);
