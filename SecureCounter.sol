// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SecureCounter {
    uint256 private _count;

    event Incremented(uint256 oldValue, uint256 newValue, uint256 amount);

    function current() external view returns (uint256) {
        return _count;
    }

    function increment(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        uint256 oldValue = _count;
        _count += amount;
        emit Incremented(oldValue, _count, amount);
    }
}
