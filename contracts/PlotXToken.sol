pragma solidity 0.5.7;


import "./external/openzeppelin-solidity/token/ERC20/ERC20.sol";


contract PlotXToken is
    ERC20
{

    constructor(
        string memory name_,
        string memory symbol_
    ) public ERC20(name_, symbol_) {
    }
}