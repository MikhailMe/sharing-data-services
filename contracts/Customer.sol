pragma solidity >=0.4.22 <0.6.0;

interface Person {
    function placeAnOrder() external returns(bool);
    function submitAnOrder() external returns(bool);
}

interface Messagable {
    function sendRequest(address user, string calldata message) external returns(bool);
    function readResponse() external returns(string memory);
}

contract Customer is Person, Messagable {
    
    address private owner;

    modifier isOwner {
        require(owner == msg.sender);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }
    
    struct Order {
        string title;
    }  
    
    mapping(uint => Order) orders;
    mapping (address => string) friendMessage;
    
    
    function addOrder(uint id, string memory title) internal isOwner returns(bool){
        orders[id].title = title;
        return true;
    }
    
    function placeAnOrder() external returns(bool) {
        return true;
    }
    
    function submitAnOrder() external returns(bool) {
        return true;
    }
    
    function sendRequest(address user, string calldata message) external returns(bool) {
        friendMessage[user] = message;
        return true;
    }
    
    function readResponse() external returns(string memory) {
        return friendMessage[owner];
    }
}