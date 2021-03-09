import 'contracts/Mask.sol';
/*
Masked Token (MASK)
Feb. 2021
Created by Masked Privacy

*/

pragma solidity =0.6.6;

contract MaskedExtensions {
    
    address public immutable ContractAddress;
    
    Mask private Extension;
    
    mapping (address => uint256) private _balances;
    
    constructor(address MaskedAddress) public 
    {
        ContractAddress = MaskedAddress;
    }
    
    function Existing(address payable _t) public {
        Extension = Mask(_t);
    }
 
    function getBalance(address user) public view returns (uint256) {
        return Extension.balanceOf(user);
    }    
    
    function transferFromUsingExtension(address recipient, uint256 tokens) public {
        Extension.transferFrom(msg.sender, recipient, tokens);
    }
    
    function transferUsingExtension(address recipient, uint256 tokens) public {
        Extension.transfer(recipient, tokens);
    }   
    
    fallback() external payable
    {
        
    }
 
    receive() external payable
    {
        
    }
}





