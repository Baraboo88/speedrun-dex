pragma solidity >=0.8.0 <0.9.0;
// SPDX-License-Identifier: MIT

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

error Balloons__ErrorWhileApporving();

contract Balloons is ERC20 {
  constructor() ERC20('Balloons', 'BAL') {
    _mint(msg.sender, 1000 ether); // mints 1000 balloons!
  }

  event BalloonsAproved();

  function approve(address spender, uint256 amount) public override returns (bool) {
    bool isOk = super.approve(spender, amount);

    if (!isOk) {
      revert Balloons__ErrorWhileApporving();
    }
    emit BalloonsAproved();
    return true;
  }
}
