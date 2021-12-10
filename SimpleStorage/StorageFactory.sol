// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

//we will try to get to deploy a contrat via using other contract

//this is how we import
import "./SimpleStorage.sol";

// by defining "is SimpleStorage" StorageFactory can now use SimpleStorage's methods
contract StorageFactory is SimpleStorage{

    //array that saves SimpleStorage contracts that have been created
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {


        //create an object of type SimpleStorage (from our import)
        SimpleStorage simpleStorage = new SimpleStorage();
        //we save it in the array, btw address of the contracts are saved
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // address
        // ABI, aplication binary interface

        //this will return the addy of the contract we want to interact with
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));

        //we store a number into the contract
        simpleStorage.store(_simpleStorageNumber);

    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        return simpleStorage.retrieve();

    }
}