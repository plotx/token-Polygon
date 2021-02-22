pragma solidity 0.5.7;


import "./external/openzeppelin-solidity/token/ERC20/ERC20.sol";


contract PlotXToken is
    ERC20
{

    address public operator;

    constructor(
        string memory name_,
        string memory symbol_,
        address _operator
    ) public ERC20(name_, symbol_) {
        operator = _operator;
    }


    modifier onlyOperator() {
        require(_msgSender() == operator, "Not operator");
        _;
    }
    
     /**
     * @dev change operator address
     * @param _newOperator address of new operator
     */
    function changeOperator(address _newOperator)
        public
        onlyOperator
        returns (bool)
    {
        require(_newOperator != address(0), "New operator cannot be 0 address");
        operator = _newOperator;
        return true;
    }
    
      /**
     * @dev Lock the user's tokens
     * @param _of user's address.
     */
    function lockForGovernanceVote(address _of, uint256 _period)
        public
        onlyOperator
    {
        if (_period.add(now) > lockedForGV[_of])
            lockedForGV[_of] = _period.add(now);
    }

    function isLockedForGV(address _of) public view returns (bool) {
        return (lockedForGV[_of] > now);
    }

}