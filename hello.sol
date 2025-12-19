// SPDX-License-Identifier: MIT
pragma solidity ^0.4.26;

contract SimpleMessage {

    string public name;
    string public message;

    constructor(string memory _name, string memory _message)  {
        name = _name;
        message = _message;
    }

    function create(string memory _name, string memory _message) public {
        name = _name;
        message = _message;
    }

    function updatefields(string memory _newName, string memory _message) public {
        name = _newName;
        message = _message;
    }

 

    function affiche() public view returns (string, string) {
        return (name, message);
    }
}
