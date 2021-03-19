import 'contracts/Mask.sol';
/*
Masked Token (MASK)
Feb. 2021
Created by Masked Privacy
Crowdsale (in progess)
*/

pragma solidity =0.6.6;

contract MaskedExtensions {
    

    mapping(address => uint256) public buyerAmounts;
    mapping(uint256 => address) public buyers;
    
    uint256 public buyerCount;
    
    address public immutable ContractAddress;
    
    Mask private Extension;
    
    mapping (address => uint256) private _balances;
    
    address public immutable OwnerAddress;
    
    constructor(address MaskedAddress) public 
    {
        ContractAddress = MaskedAddress;
        OwnerAddress = msg.sender;
        buyerCount = 0;
    }
    
    function Existing(address payable _t) public {
        Extension = Mask(_t);
    }
 
    function getBalance(address user) public view returns (uint256) {
        return Extension.balanceOf(user);
    }    
    
    function withdraw() public { //withdraw all ETH previously sent to this contract
        require(msg.sender == OwnerAddress, "Wrong caller.");
        msg.sender.transfer(address(this).balance);
    }
    
    
    function getContractBalance() public view returns (uint256) { //view amount of ETH the contract contains
        require(msg.sender == OwnerAddress, "Wrong caller.");
        return address(this).balance;
    }    
    
    
    fallback() external payable
    {
        
    }
 
    receive() external payable
    {
        if(msg.value > 0.05 ether)
        {
            buyers[buyerCount] = msg.sender;
            buyerAmounts[msg.sender] = msg.value;
            buyerCount += 1;            
        }
        else
            revert("Must send above 0.05 ether to get tokens.");
    }
}
