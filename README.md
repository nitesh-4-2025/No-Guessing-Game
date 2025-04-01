# Number Guessing Game - Solidity Smart Contract

This Solidity smart contract implements a simple number guessing game with automated prize distribution. Players guess a number by sending Ether, and if they guess correctly, they win the prize pool.

## Features
- Players can guess a number by sending Ether.
- If the guess is correct, the player wins the entire prize pool.
- The contract owner can set the secret number.
- The contract maintains a prize pool, funded by players and manually by the owner.
- The owner can withdraw funds if needed.

## How It Works
1. The owner sets a secret number using `setSecretNumber(uint256 _number)`.
2. Players participate by calling `play(uint256 guess)` and sending Ether.
3. If the guessed number matches the secret number, the player wins the prize pool.
4. Players can fund the game using `fundGame()`.
5. The owner can withdraw excess funds using `withdrawFunds(uint256 amount)`.

## Contract Address
```
0x0436e31fe843133E4052355B979779397F87660a
```

## Security Considerations
- Ensure the contract is properly tested before deployment.
- Players should verify the contract address before sending Ether.
- The secret number is stored in the contract, making it potentially vulnerable to blockchain explorers.

## License
This project is open-source and provided under the MIT License.

