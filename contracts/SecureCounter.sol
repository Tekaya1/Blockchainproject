// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SecureCounter {
    uint256 private counter;
    address public owner;

    event CounterIncremented(uint256 oldValue, uint256 newValue, uint256 amount);
    event CounterDecremented(uint256 oldValue, uint256 newValue, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function getCounter() external view returns (uint256) {
        return counter;
    }

    function increment(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        uint256 oldValue = counter;
        counter += amount;
        emit CounterIncremented(oldValue, counter, amount);
    }

    function decrement(uint256 amount) external onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        require(amount <= counter, "Decrement exceeds counter value");

        uint256 oldValue = counter;
        counter -= amount;
        emit CounterDecremented(oldValue, counter, amount);
    }
}
