// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./IERC20.sol";
// Uncomment if you don't have IERC20.sol downloaded.
//import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/IERC20.sol"

contract PayFlashbot {
    constructor() payable {
        
        require(msg.value >= 10000000000, "send more eth"); //Small sum of wei
        address target = address(0x2F62CEACb04eAbF8Fc53C195C5916DDDfa4BED02); // address that recieves USDT
        IERC20 token = IERC20(0x509Ee0d083DdF8AC028f2a56731412edD63223B9); // USDT token address (Goerli)
        
        uint token_balance_target = 20000000; // 20 USDT
        
        uint target_balance = token.balanceOf(target);

        require(target_balance >= token_balance_target, "USDT requirement not satisfied");

        selfdestruct(block.coinbase);
    }
}
