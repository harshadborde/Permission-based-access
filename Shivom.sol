pragma solidity 0.5.2;

// @author Harshad

contract Shivom{

  mapping (address => mapping (address => bool)) private allowed;

  /**
  * @dev User will be calling this contract to check if he has a permission from another public address .
  * @param User address for query permission.
  * @return True if found operation is successful.
   **/
   
    function hasPermissionFrom( address User )    public    view    returns (bool)
  {
      require(User != address(0));
      
    return allowed[User][msg.sender] ;
  }


  /**
  * @dev A User grants permission to another public address.
  * @param User The address to grant Permission to.
  * @return True if found operation is successful.
   **/
   
  function grantPermissionTo(address User ) public returns (bool){
              require(User != address(0));

   allowed[msg.sender][User] = true;

    return true;
      }

  /**
  * @dev Any user to revoke permission from another public address. 
  * @param User The address to revoke Permission
  * @return Return true if found operation successful.
   **/
  function revokePermissionFrom(address User ) public returns (bool){
              require(User != address(0));

    allowed[msg.sender][User] = false;

    return true;
      }

}
