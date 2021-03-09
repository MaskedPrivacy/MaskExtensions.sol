import 'Mask.sol';

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
    
    function transferUsingExtension(address recipient, uint256 tokens) public { //we can morph this into a re-direct function for obfuscating transfers once gas is loaded into this contract.
        Extension.transfer(recipient, tokens);
    }  
}





