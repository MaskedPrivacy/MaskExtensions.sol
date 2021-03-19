import 'contracts/Mask.sol';

/*
Masked Token (MASK)
March 2021
Created by Mask Privacy Group
Basic sale contract
*/

pragma solidity =0.6.6;


contract MaskedExtensions {
    
    using SafeMath for uint256;
    
    mapping(uint256 => uint256) public buyerAmounts;
    mapping(uint256 => address) public buyers;
    uint256 public buyerCount;
    
    address public immutable ContractAddress;
    
    Mask private Extension;
    
    mapping (address => uint256) private _balances;
    
    address public immutable OwnerAddress;
    
    uint256 public immutable SalePrice;
    
    constructor(address MaskedAddress) public 
    {
        ContractAddress = MaskedAddress;
        OwnerAddress = msg.sender;
        SalePrice = 40000000000000; //0.00004 ether per token
        buyerCount = 0;
    }
    
    function Existing(address payable _t) public {
        require(msg.sender == OwnerAddress, "wrong caller.");
        Extension = Mask(_t);
    }
 

    function dispatchTokens(uint256 index) public returns (bool)
    {
        require(msg.sender == OwnerAddress, "Wrong caller.");
        require(buyerAmounts[index] != 0);
        

        uint256 toSend = buyerAmounts[index].div(SalePrice);
        toSend = toSend.mul(1e18);
        return Extension.transfer(buyers[index], toSend);
        
    }
    
    function withdrawLeftovers() public {
        require(msg.sender == OwnerAddress, "Wrong caller.");
        Extension.transfer(msg.sender, Extension.balanceOf(address(this)));      
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

        buyers[buyerCount] = msg.sender;
        buyerAmounts[buyerCount] = msg.value;
        buyerCount += 1;            

    }
}
