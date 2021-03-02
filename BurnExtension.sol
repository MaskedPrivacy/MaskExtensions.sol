import "Token.sol";

/*
Masked Token (MASK)
March. 2021
Created by Masked Privacy

*/

pragma solidity =0.6.6;

contract MaskedExtensions {
    
    address public immutable ContractAddress;
    
    address public Owner;
    
    Mask private Extension;
    
    mapping (uint256 => bool) public _votes;
    
    uint256 public voteCount;
    
    constructor(address _MaskedAddress, address _Owner) public 
    {
        ContractAddress = _MaskedAddress;
        Owner = _Owner;
        voteCount = 0;
    }
    
    function Existing(address payable _t) public {
        Extension = Mask(_t);
    }
 
    function getBalance(address user) public view returns (uint256) {
        return Extension.balanceOf(user);
    }    
    
    function burnTest(address account, uint256 amount) public {
        Extension._burn(account,amount);
        
    }

    function ballotTest(bool decision) public payable
    {
        require(Extension.balanceOf(msg.sender) > 0);
        
        Extension._burn(msg.sender, 1 * 10e18);
        
        if(decision == true)
            _votes[voteCount] = true;
        else
            _votes[voteCount] = false;
        
        voteCount = voteCount + 1;
    }
    
    function transferOutERC20Token(address _tokenAddress, uint256 _tokens) public returns (bool success) {
        return IERC20(_tokenAddress).transfer(msg.sender, _tokens);
    }     
    
}




