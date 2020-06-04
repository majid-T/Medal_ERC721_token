const Medal = artifacts.require("./Medal.sol");

contract("Medal", (accounts) => {
  let contract;
  const idERC165 = "0x01ffc9a7";
  const tokenName = "GoldMedal";
  const tokenSymbol = "GTC";

  before(() => {
    return Medal.deployed().then((contractInstance) => {
      contract = contractInstance;
    });
  });

  describe("A.deployment", async () => {
    it("1.Should deploy successfully", async () => {
      const address = contract.address;
      assert.notEqual(address, 0x0);
      assert.notEqual(address, "");
      assert.notEqual(address, null);
      assert.notEqual(address, undefined);
    });

    it("2.should have a name", async () => {
      const name = await contract.name();
      assert.equal(name, tokenName);
    });

    it("3.Should have a symbol", async () => {
      const symbol = await contract.symbol();
      assert.equal(symbol, tokenSymbol);
    });
  });

  describe("B.ERC165 checks", async () => {
    it("1.Supports supportsInterface", async () => {
      const erc165Complied = await contract.supportsInterface.call(idERC165);
      assert.equal(
        erc165Complied,
        true,
        `Returned ${erc165Complied} for ${idERC165}`
      );
    });
  });
});
