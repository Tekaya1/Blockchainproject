// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "remix_tests.sol";
import "../SecureCounter.sol";

contract SecureCounterTest {
    SecureCounter counter;

    function beforeEach() public {
        counter = new SecureCounter();
    }

    function testInitialValueIsZero() public {
        Assert.equal(counter.current(), uint256(0), "Initial counter should be 0");
    }

    function testIncrementWithValidAmount() public {
        counter.increment(5);
        Assert.equal(counter.current(), uint256(5), "Counter should be incremented by 5");
    }

    /// #sender: account-0
    function testIncrementTwice() public {
        counter.increment(2);
        counter.increment(3);
        Assert.equal(counter.current(), uint256(5), "Counter should be 5 after 2 + 3");
    }

    function testIncrementWithZeroShouldRevert() public {
        try counter.increment(0) {
            Assert.ok(false, "Expected revert, but call succeeded");
        } catch Error(string memory reason) {
            Assert.equal(reason, "Amount must be greater than zero", "Wrong revert reason");
        } catch {
            Assert.ok(false, "Unexpected error type");
        }
    }
}
