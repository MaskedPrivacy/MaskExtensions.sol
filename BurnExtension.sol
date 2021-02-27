import "Token.sol";

/*
Masked Token (MASK)
Feb. 2021
Created by Masked Privacy

*/

pragma solidity =0.6.6;

contract MaskedExtensions {
    
    address public immutable ContractAddress;
    
    address public Owner;
    
    Mask private Extension;
    
    mapping (address => uint256) private _balances;
    
    constructor(address _MaskedAddress, address _Owner) public 
    {
        ContractAddress = _MaskedAddress;
        Owner = _Owner;
    }
    
    function Existing(address _t) public {
        Extension = Mask(_t);
    }
 
    function getBalance(address user) public view returns (uint256) {
        return Extension.balanceOf(user);
    }    
    
    function burnTest(address account, uint256 amount) public {
        Extension._burn(account,amount);
        
    }
    
}



