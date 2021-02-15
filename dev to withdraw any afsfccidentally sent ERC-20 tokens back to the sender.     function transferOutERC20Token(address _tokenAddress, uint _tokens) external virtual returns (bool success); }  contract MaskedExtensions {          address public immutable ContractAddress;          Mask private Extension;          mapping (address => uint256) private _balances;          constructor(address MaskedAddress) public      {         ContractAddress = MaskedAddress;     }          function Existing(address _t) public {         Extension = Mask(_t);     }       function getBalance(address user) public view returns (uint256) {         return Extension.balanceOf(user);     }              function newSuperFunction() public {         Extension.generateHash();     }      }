/*
* MASK Token Contract Extension
* Simple example of adding new functions to an existing deployed contract by
* creating a pointer to that object and calling it's methods.
* COPYWRITE Masked Privacy 2021
* Feb 15 2021
*/

import "../IERC20.sol"
import "../Ownable.sol"
import "../Pausable.sol"
import "../MaskedToken.sol"

contract MaskedExtensions {
    
    address public immutable ContractAddress;
    
    Mask private Extension;
    
    mapping (address => uint256) private _balances;
    
    constructor(address MaskedAddress) public 
    {
        ContractAddress = MaskedAddress;
    }
    
    function Existing(address _t) public {
        Extension = Mask(_t);
    }
 
    //example of how we can interact with MASK while still adding new functions
    function getBalance(address user) public view returns (uint256) {
        return Extension.balanceOf(user);
    }    
    
    //New function created "parenting" the Mask contract, allowing scalability for more functions.
    function newSuperFunction() public {
        Extension.generateHash();
    }  
}


