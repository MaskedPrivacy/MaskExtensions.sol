pragma solidity =0.6.6;

import "SafeERC20.sol";
import "IERC20.sol";

contract TokenTimelock {
    using SafeERC20 for IERC20;

    address public immutable beneficiary;

    uint256 public immutable releaseTime;

    constructor(
        address _beneficiary,
        uint256 _releaseTime
    )
    public
    {
        // solium-disable-next-line security/no-block-members
        require(_releaseTime > block.timestamp);
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }

    function release(IERC20 _token) public {
        // solium-disable-next-line security/no-block-members
        require(block.timestamp >= releaseTime);

        uint256 amount = _token.balanceOf(address(this));
        require(amount > 0);

        _token.safeTransfer(beneficiary, amount);
    }
}