const Medal = artifacts.require("Medal");

module.exports = function (deployer) {
  deployer.deploy(Medal);
};
