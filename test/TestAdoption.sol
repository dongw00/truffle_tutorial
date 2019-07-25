pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());
  uint expectedPetId = 8;
  address expectedAdopter = address(this);

  /* adopt() 함수 테스트 */
  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(expectedPetId);

    Assert.equal(returnedId, expectedPetId, "입양한 펫 id가 일치하지 않습니다.");
  }

  /* 특정 펫의 소유자 address가 맞는지 체크 */
  function testGetAdopterAddressByPetId() public {
    address adopter = adoption.adopters(expectedPetId);

    Assert.equal(adopter, expectedAdopter, "소유자 address가 일치하지 않습니다.");
  }

  /* 모든 펫 소유자 address가 맞는지 체크 */
  function testGetAdopterAddressByPetIdInArray() public {
    // Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[expectedPetId], expectedAdopter, "소유자가 일치하지 않습니다.");
  }
}