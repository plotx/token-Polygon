pragma solidity 0.5.7;
import "../PlotXToken.sol";

contract MockPLOT is PlotXToken {

	constructor(string memory name_,
        string memory symbol_,
        uint8 decimals_,
        address childChainManager) public PlotXToken(name_,symbol_,decimals_,childChainManager) {
    }

    function mint(address user, uint amount) public returns(bool) {
    	_mint(user,amount);
    }

}