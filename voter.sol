//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

contract publicvoter{
    uint public totalVotes=0;
    uint[3] vote=[0,0,0];
    address official = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    address[] voters;
    function check(address _addr) private view returns(bool){
        for(uint i=0;i<voters.length;i++){
            if(voters[i]==_addr){
                return false;
            }
        }
        return true;
    }
    function voteit(uint _n) private {
            vote[_n]+=1;
            ++totalVotes;
            require(check(msg.sender),"Voter already exist");
            voters.push(msg.sender);

    }
    function voteBJP() public {
        voteit(0);
    }
    function voteCONG() public {
        voteit(1);
    }
        function voteAAP() public {
            voteit(2);  
    }
    function getVotes(uint _n) public view returns(uint){

        require(msg.sender==official,"You are not authorised");
        return vote[_n];
    }


}
