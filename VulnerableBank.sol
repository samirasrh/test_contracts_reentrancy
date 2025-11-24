// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VulnerableBank {
    mapping(address => uint256) public balances;

    // Deposit funds
    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    // Withdraw funds
    function withdraw(uint256 _amount) external {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        // Transfer funds before updating balance
        payable(msg.sender).transfer(_amount);
        balances[msg.sender] -= _amount;
    }
}
