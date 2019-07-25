pragma solidity ^0.5.0;

contract Adoption {
  address[16] public adopters;

  function adopt(uint petId) public returns (uint) {
    require(petId >= 0 && petId <= 15, "Pet id가 올바르지 않습니다.");

    adopters[petId] = msg.sender;

    return petId;
  }

  function getAdopters() public view returns(address[16] memory) {
    return adopters;
  }
}