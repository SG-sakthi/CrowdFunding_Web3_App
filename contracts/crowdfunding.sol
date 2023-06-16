// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract crowdfunding {
    
//to acheive our goals we need to describe these variables 

     struct Campaign{
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadline;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations;
        
      }
        mapping(uint256 => Campaign) public campaigns;//mapping 

        uint256 public numberofCampigns = 0; //Global variable  

      // functions that contains all the logic of the smartcontract

      // string uses (memory) before parameter(datatype memory _parameter)

        
        // function to create campign
        function createCampaign(address _owner,string memory _title,string memory _description,
        uint256 _target,uint256 _deadline,string memory _image)public returns (uint256){
         Campaign storage campign = campaigns[numberofCampigns];

         require(campign.deadline < campign.timestamp, "the deadline should be the date in the future");\
          //if == require (timestamp == realtime)
         // the statement explains that deadline time is lesser than the real time the deadline oftthe contract is in future 

         // if the condition passed it passes all the values
         campign.owner=_owner;
         campign.title=_title;
         campign.description=_description;
         campign.deadline=_deadline;
         campign.amountCollected=0;
         campign.image=_image;

         numberofCampigns++; // increase the value of campaigns

         return numberofCampigns -1;    
        }
        // if we need Id we need to donate Money  
        function donateToCampaign(uint256 _id)public payable{
         //payable - send some cryptocurrency throughout this function

         uint256 amount = msg.value; //thus we are tryinng send from the frontend
         Campaign storage campign = campaigns[_id];

         campign.donators.push(msg.sender);

         campign.donations.push(amount);

         (bool sent) = payable()

        }
        function getDonators(){}

        function getCampaigns()[]



     
}