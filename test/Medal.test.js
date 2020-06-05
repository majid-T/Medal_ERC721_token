const Medal = artifacts.require("./Medal.sol");

contract("Medal", (accounts) => {
  let contract;
  const idERC165 = "0x01ffc9a7";
  const idERC721 = "0x80ac58cd";
  const idERC721Meta = "0x5b5e139f";
  const tokenName = "GoldMedal";
  const tokenSymbol = "GTC";
  const deployerAdd = accounts[0];

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

    it("3.should have a name", async () => {
      const name = await contract.name();
      assert.equal(name, tokenName);
    });

    it("4.Should have a symbol", async () => {
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
});
