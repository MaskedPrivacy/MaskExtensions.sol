/*
* MASK Token Contract Extension
* Simple example of adding new functions to an existing deployed contract by
* creating a pointer to that object and calling it's methods.
* COPYWRITE Masked Privacy 2021
* Feb 15 2021
*/

import "IERC20.sol"
import "Ownable.sol"
import "Pausable.sol"
import "MaskedToken.sol"

contract MaskedBurnExtension {
    
    address public immutable ContractAddress;
    
    Mask private Extension;
    
    mapping (address => uint256) private _balances;
    
    uint256 public burnedTokens;
    
    constructor(address MaskedAddress) public 
    {
        ContractAddress = MaskedAddress;
    }
    
    function Existing(address _t) public {
        Extension = Mask(_t);
    }
     
    function getBurnedTokens() public view returns (uint256) {
        return Extension.burnedTokens;
    }  
    
    //todo: work on this when some spare time is had
    function releaseBurnedTokens() public returns (uint256) {
    
    }
    
}
