pragma solidity ^0.4.18;


contract Counter {

  uint8 public counts;

  function Counter() public {

  }

  
  
   event AddedCandidate(uint candidateID);

    // describes a Voter, which has an id and the ID of the candidate they voted for
    struct Voter {
        string uid; // bytes32 type are basically strings
        uint candidateIDVote;
    }
    // describes a Candidate
    struct Candidate {
        string name;
        string party; 
        // "bool doesExist" is to check if this Struct exists
        // This is so we can keep track of the candidates 
        bool doesExist; 
    }

    // These state variables are used keep track of the number of Candidates/Voters 
    // and used to as a way to index them     
    uint numCandidates; // declares a state variable - number Of Candidates
    uint numVoters;

    
    // Think of these as a hash table, with the key as a uint and value of 
    // the struct Candidate/Voter. These mappings will be used in the majority
    // of our transactions/calls
    // These mappings will hold all the candidates and Voters respectively
    mapping (uint => Candidate) candidates;
    mapping (uint => Voter) voters;
    
   

    function addCandidate(string name, string party) public {
        // candidateID is the return variable
        uint candidateID = numCandidates++;
        // Create new Candidate Struct with name and saves it to storage.
        candidates[candidateID] = Candidate(name,party,true);
        AddedCandidate(candidateID);
    }

    function vote(string uid, uint candidateID) public {
        // checks if the struct exists for that candidate
        if (candidates[candidateID].doesExist == true) {
            uint voterID = numVoters++; //voterID is the return variable
            voters[voterID] = Voter(uid,candidateID);
        }
    }


    

    // finds the total amount of votes for a specific candidate by looping
    // through voters 
    function totalVotes(uint candidateID) view public returns (uint) {
        uint numOfVotes = 0; // we will return this
        for (uint i = 0; i < numVoters; i++) {
            // if the voter votes for this specific candidate, we increment the number
            if (voters[i].candidateIDVote == candidateID) {
                numOfVotes++;
            }
        }
        return numOfVotes; 
    }

    function getNumOfCandidates() public view returns(uint) {
        return numCandidates;
    }

    function getNumOfVoters() public view returns(uint) {
        return numVoters;
    }
    // returns candidate information, including its ID, name, and party
    function getCandidate(uint candidateID) public view returns (uint,string, string) {
        return (candidateID,candidates[candidateID].name,candidates[candidateID].party);
    }


}