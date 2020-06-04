const Medal = artifacts.require("./Medal.sol");

contract("Medal", (accounts) => {
  let contract;

  before(() => {
    return Medal.deployed().then((contractInstance) => {
      contract = contractInstance;
    });
  });

  describe("A.deployment", async () => {
    it("1.Should deploys successfully", async () => {
      const address = contract.address;
      assert.notEqual(address, 0x0);
      assert.notEqual(address, "");
      assert.notEqual(address, null);
      assert.notEqual(address, undefined);
    });

    it("2.should has a name", async () => {
      const name = await contract.name();
      assert.equal(name, "GoldMedal");
    });

    it("3.Should has a symbol", async () => {
      const symbol = await contract.symbol();
      assert.equal(symbol, "GTC");
    });
  });
});
