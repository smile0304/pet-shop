pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {

  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  function testUserCanAdoptPet() public{
    uint returnedID = adoption.adopt(8);

    uint excepted = 8;

    Assert.equal(returnedID, excepted, "Adoption of pet ID 8 should be recorded.");

  }

  function testGetAdopterAddressByPetid() public{

    address expected = this;
    address adopter = adoption.adopters(8);

    Assert.equal(expected, adopter, "Owner of pet ID 8 should be recorded.");
  }

  function testGetAdopterAddressByPetIdInArry() public {

    address expected = this;
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");

  }
}
