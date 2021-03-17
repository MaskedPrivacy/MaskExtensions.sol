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
    
    uint256 constant tokenPrice = 0.1 ether;
    
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
    
    
    function swapTokens(uint256 tokenAmount) public payable returns (bool)
    {
        require(msg.value >= tokenAmount * tokenPrice);
    
        //convert tokenamount into its 18 decimal equivalent..
        uint256 totalTokens = tokenAmount * 1e18 / 0.1 ether;
        
        require(Extension.transferFrom(address(this), msg.sender, totalTokens) == true, "Could not send tokens to the buyer");
        return true;
    }
    
    
    fallback() external payable
    {
        
    }
 
    receive() external payable
    {
        
    }
}
