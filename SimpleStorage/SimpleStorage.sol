
// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;
//first you always define sol version

//like a class in java
contract SimpleStorage {

    //uint256 favouriteNumber;
    //bool favouriteBool = true;
    //string favouriteString = "String";
    //int favouriteInt = -5;

    //data type for addresses
    //address favouriteAddress = 0xF1f1baF45b085687b1F2fD6B8fb0f8aA044e504b;

    //bytes 32 is max actually
    //bytes32 favouriteBytes = "cat";

    //if number is not initialized, it sets itself to 0
    //you can set it to public, private it, ex, etc...
    //if you set it to public, it gets its own getter method by default
    uint256 favouriteNumber;

    //functions just like in java or cpp
    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    //keyword external tells us that, things MUST be called from external contracts
    //in this case NOT SimpleStorage

    //keyword internal, tells us that it MUST be called from this very contract where it resides
    //in this case SimpleStorage

    // view, defines that we are reading off the blockchain
    function retrieve() public view returns(uint256) {
        return favouriteNumber;
    }

    //pure functions do some kind of math
    function math(uint256 favouriteNumber) public pure {
        favouriteNumber + favouriteNumber;
    }
    //be vary that you dont want to save anything, because that would write to the chain


    struct People {
        uint256 favouriteNumber;
        string name;
    }

    People public person = People(
        {
            favouriteNumber: 2,
            name: "kek"
        }
    );

    //array
    People[] public people;

    //memory means that it will be stored only during execution of function or contract call
    //if we store it in storage the data will persist
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        people.push(People({favouriteNumber: _favouriteNumber, name: _name}));

        //here we map the name to the favourite number
        nameToFavNo[_name] = _favouriteNumber;
    }


    //mapping - map or hashmap
    //we search my inputing the name, which is the key
    mapping(string => uint256) public nameToFavNo;



}