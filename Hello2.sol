// SPDX-License-Identifier: MIT
pragma solidity ^0.4.5;

contract SimpleCounter {

    uint message;
    address owner;

    constructor() public {
        // owner = msg.sender;
        if(msg.sender != owner) {
            return ;
        }
        
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function increment(uint valeur) public {
        message = message + valeur;
    }


    function decrement(uint valeur) public onlyOwner {
        require(message >= valeur);
        message = message - valeur;
    }

    function affiche() public view returns (uint) {
        return message;
    }
}
