// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 < 0.9.0;
import './Ownable.sol';

contract Destructible is Ownable {
    
    constructor() payable {}

    function destroy() public onlyOwner {
        selfdestruct(payable(owner));
    }
    
    // Allow users to withdraw their funds
    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        payable(msg.sender).transfer(address(this).balance);
    }
}
