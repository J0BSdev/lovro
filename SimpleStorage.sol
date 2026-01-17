//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
  //favoriteNumber gets initialized to 0 if no value is given

 uint256 public myFavoriteNumber; //0

//uint256[] listOfFavoriteNumbers;
struct Person {
    uint256 favoriteNumber;
    string name;
}
// dynamic array
 //static array
Person[] public listOfPeople; //empty array []


mapping(string => uint256) public nameToFavoriteNumber;                

// Person public pat = Person({favoriteNumber:7, name: "Pat"});
//person public mariah=Person({favoriteNumber:10, name: "Mariah"});;

 function store (uint256 _favoriteNumber) public {
     myFavoriteNumber = _favoriteNumber;
    
 }

//view ,pure
function retrieve() public view returns(uint256){
    return myFavoriteNumber;
}
//calldata,memory,storage
    function addPerson( string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));

        nameToFavoriteNumber[_name] = _favoriteNumber;
    }



}

