// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BAToken is ERC20, Ownable {

    // Constructor to initialize the ERC-20 token with a name and symbol,
    // and mint an initial supply to the contract deployer.
    constructor() ERC20("Brylle Andres", "BA") Ownable(msg.sender){
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    // Function to allow the contract owner to mint new tokens and assign them to a specified address.
    // This function can only be called by the owner.
    function mint(address to, uint256 amount) public onlyOwner {  
        require(to == msg.sender, "Authorized Personnel only!"); 
        _mint(to, amount);
    }

    // Function to allow the burning (destruction) of tokens by the token holder.
    // The amount parameter specifies the number of tokens to be burned.
    // This function is public, allowing anyone to burn their own tokens.
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
