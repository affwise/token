pragma solidity ^0.4.11;

import 'zeppelin-solidity/contracts/token/StandardToken.sol';
import 'zeppelin-solidity/contracts/lifecycle/Pausable.sol';

contract AffwiseToken is StandardToken, Pausable {

    string public constant name = "Affwise Token";
    string public constant symbol = "AFW";
    uint32 public constant decimals = 18;

    function AffwiseToken(uint _totalSupply) {
        require(_totalSupply > 0);
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply
    }
}
