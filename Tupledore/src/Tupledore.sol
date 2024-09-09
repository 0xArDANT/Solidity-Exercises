// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Tupledore {
    /* This exercise assumes you know about tuples/struct in solidity.
        1. Create a struct named `UserInfo` with types address 
           and uint256.
        2. Create a variable of type UserInfo, named `userInfo`.
        3. Create a function called `setTuple` that takes in 
           a address and uint256 and sets the all values 
           the `userInfo` variable you created above.
        4. Create a function called `returnTuple`, 
           that returns `userInfo` (as a tuple)
    */

    struct UserInfo {
      address addr;
      uint256 age;
    }

    UserInfo userInfo;

    function setTuple(address _addr, uint256 _age) public {
      userInfo = UserInfo(_addr, _age);
    }

    function returnTuple() public view returns(address, uint256) {
      return (userInfo.addr, userInfo.age);
    }
}
