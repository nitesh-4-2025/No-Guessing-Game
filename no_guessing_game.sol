pragma solidity ^0.8.0;

contract NumberGuessingGame {
    address payable owner;
    uint256 secretNumber;
    uint256 public prizePool;

    mapping(address => uint256) public attempts;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function setSecretNumber(uint256 _number) public onlyOwner {
        secretNumber = _number;
    }

    function play(uint256 guess) public payable {
        require(msg.value > 0, "Send Ether to participate");
        require(guess > 0, "Invalid guess");
        
        prizePool += msg.value;
        attempts[msg.sender]++;

        if (guess == secretNumber) {
            uint256 reward = prizePool;
            prizePool = 0;
            payable(msg.sender).transfer(reward);
        }
    }

    function fundGame() public payable {
        require(msg.value > 0, "Must send some Ether");
        prizePool += msg.value;
    }

    function withdrawFunds(uint256 amount) public onlyOwner {
        require(amount <= address(this).balance, "Not enough balance");
        payable(owner).transfer(amount);
    }
}
