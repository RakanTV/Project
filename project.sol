pragma solidity ^0.5.1;

contract project {
    
    struct Doctors{
        string name;
        string specialty;
        uint year;
        //bool set;
    }
    
    struct Patients{
        string name;
        string gender;
        uint age;
        //bool set;
    }
    
address public owner;
address[] public AddressArray;

mapping(address => Doctors) mappingDoctors;
mapping(address => Patients) mappingPatients;
mapping(address => bool) mappingCheckAdress;
mapping(address => string) DorP;


  function AddAdress() public {
  //check for old users
  if (mappingCheckAdress[msg.sender]){
    revert();
  } 
  else {
    AddressArray.push(msg.sender);
    mappingCheckAdress[msg.sender] = true;
  }
 }
function lengthOfArray() public view returns(uint)
{
return AddressArray.length;
}

function SignupForPatient(string memory _name, string memory _gender,uint _age ) public {
{
    
  owner = msg.sender;
  Patients storage user = mappingPatients[owner];
     AddressArray.push(msg.sender);
  //require(!user.set);
   //Store the user
   //mappingPatients[msg.sender] = Patients({
       //name: _name,
       //gender: _gender,
       //age: _age,
       //set: true
   //});
}
}

function SignupForDoctor(string memory _name, string memory _specialty,uint _year ) public {

  owner = msg.sender;
  Doctors storage user = mappingDoctors[owner];
   // Check that the user did not already exist:
   AddressArray.push(msg.sender);
  //require(!user.set);
   //Store the user
   //mappingDoctors[msg.sender] = Doctors({
     //  name: _name,
       //specialty: _specialty,
       //year: _year,
       //set: true
   //});
}


function checkIfRegistered() public returns(bool)
{
    return mappingCheckAdress[msg.sender];
}

function addAddress() public 
{
    mappingCheckAdress[msg.sender] = true;
    AddressArray.push(msg.sender);
}

function returnDoctor() public returns (string memory, string memory, uint)
{
    Doctors memory z = mappingDoctors[msg.sender];
    return (z.name, z.specialty, z.year);
}

function returnPatient() public returns (string memory, string memory, uint)
{
 
    Patients memory y = mappingPatients[msg.sender];
    return (y.name, y.gender, y.age);
}

function login() public returns(uint)
{
    if(checkIfRegistered() == true)
    {
        string memory y = DorP[msg.sender];
        
        if(keccak256(abi.encodePacked(y)) == keccak256(abi.encodePacked("D")))
        {
            return 1;
            //returnDoctor();
        } 
        return 2;
        // returnPatient();
    }
}

function addDoctor(string memory _name, string memory _specialty,uint _year) public
{
    // if(checkIfRegistered()  == true)
    // {
    //     return 1;
    // }
    
    addAddress();
    DorP[msg.sender] = "D";
    
    Doctors memory x = Doctors(_name, _specialty, _year);
    mappingDoctors[msg.sender] = x;
    //return 2;
}

}


