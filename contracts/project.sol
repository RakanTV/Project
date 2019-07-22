pragma solidity ^0.5.1;

contract project {
   
       struct BloodDonation{
        string name;
        string bloodType;
        string date;
    }
    
    struct Doctor{
      //string _address;
      string specialty;
      string name;
      uint year;
      string word;

    }
    
    struct Patient{
        string _address;
        string name;
        string gender;
        uint age;
        string word;
    }
    
    
mapping(address => Doctor) mappingDoctors;
mapping(address => Patient) mappingPatients;
mapping(address => BloodDonation) public mappingBloodDonation;

address owner;
address [] AddressArray;

function SignupForPatient(string memory _name, string memory _gender,uint _age,string memory _word ) public {
  owner = msg.sender;
  string memory _word = "P";
  Patient storage p = mappingPatients[owner];
  AddressArray.push(msg.sender);

}

function SignupForDoctor(string memory _name, string memory _specialty,uint _year,string memory _word) public returns (string memory )
{
 owner = msg.sender;
 string memory _word = "D";
    //Doctor memory d = Doctor(_name, _specialty, _year, _word);
  Doctor storage d = mappingDoctors[owner];
    AddressArray.push(msg.sender);
    return "hi";
}


function SignDon(string memory _name, string memory _bloodType,string memory _date ) public {

  owner = msg.sender;
  BloodDonation storage bd = mappingBloodDonation[owner];
   AddressArray.push(msg.sender);

}

function returnDoctor() public returns (string memory, string memory, uint)
{
    Doctor memory z = mappingDoctors[msg.sender];
    return (z.name, z.specialty, z.year);
}

function returnPatient() public returns (string memory, string memory, uint)
{
 
    Patient memory y = mappingPatients[msg.sender];
    return (y.name, y.gender, y.age);
}

function returnBloodDonation () public returns (string memory, string memory,string memory)
{
 
    BloodDonation memory b = mappingBloodDonation[msg.sender];
    return (b.name, b.bloodType, b.date);
}


function login() public returns(uint)
{
    owner = msg.sender;
        if(keccak256(abi.encodePacked(owner)) == keccak256(abi.encodePacked("D")))
        {
            return 1;
            //returnDoctor();
        } 
        return 2;
        // returnPatient();
    
}

}