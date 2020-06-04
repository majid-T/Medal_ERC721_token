const Medal = artifacts.require("./Medal.sol");

contract("Medal", (accounts) => {
  let contract;

  before(() => {
    return Medal.deployed().then((contractInstance) => {
      contract = contractInstance;
    });
  });

  describe("deployment", async () => {
    it("should deploys successfully", async () => {
      const address = contract.address;
      assert.notEqual(address, 0x0);
      assert.notEqual(address, "");
      assert.notEqual(address, null);
      assert.notEqual(address, undefined);
    });
  });
});
