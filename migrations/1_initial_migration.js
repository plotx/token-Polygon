const Migrations = artifacts.require("Migrations");
const PlotXToken = artifacts.require("MockPLOT");

module.exports = function(deployer, network, accounts) {
  deployer.then(async () => {
	  await deployer.deploy(Migrations);
	  let deployPlotusToken = await deployer.deploy(PlotXToken, "PLOT", "PLOT", 18,accounts[0], accounts[0]);
	  await deployPlotusToken.mint(accounts[0],"30000000000000000000000000");
  });
};
