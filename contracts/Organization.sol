pragma solidity >=0.4.22 <0.6.0;

import "browser/Customer.sol";

interface Actions {
    function addClient() external returns(bool);
}

contract Organization is Actions {

	address private owner;

    modifier isOwner {
        require(owner == msg.sender);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }
    
    mapping(address => Customer) customers;
    
    function addClient() external isOwner returns(bool) {
    	return true;
    }
}