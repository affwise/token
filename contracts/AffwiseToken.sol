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
    
    function transfer(address _to, uint256 _value) public whenNotPaused validDestination(_to) returns (bool) {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public whenNotPaused validDestination(_to) returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }

    modifier validDestination(address _to) {
        require(_to != address(0x0));
        require(_to != address(this));
        _;
    }
}
