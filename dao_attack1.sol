// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

interface IDao {
    function withdraw() external ;
    function deposit()external  payable;
 }

contract Hacker{
    IDao dao; 

    constructor(address _dao){
        dao = IDao(_dao);
    }

    function attack() public payable {
        // Seed the Dao with at least 1 Ether.
        require(msg.value >= 1 ether, "Need at least 1 ether to commence attack.");
        //Deposit
        

        // Withdraw from Dao.
        
    }

    fallback() external payable{
        if(address(dao).balance >= 1 ether){
            // remove
        }
    }

    function getBalance()public view returns (uint){
        return address(this).balance;
    }
}
