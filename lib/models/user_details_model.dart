


class UserProfileData {
   String ? image, firstName, lastName,emailId,floorName,blockName,gender,role, id,number,flatNo;
  
  UserProfileData({
    this.id,
    this.firstName,
    this.image,
    this.lastName,
    this.emailId,
    this.floorName,
    this.blockName,
    this.number,
    this.flatNo,
    this.gender,
    this.role,
  });

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname':firstName,
      'lastname':lastName,
      'number': number,
      'imagepath':image,
      'role':role,
      'email':emailId,
      'flatno':flatNo,
      'blockName' :blockName,
      'ventureName':floorName,
      'gender':gender,
    
    };
  }
  

   @override
  String toString() {
    return 'UserProfileData{id: $id, firstname: $firstName,lastname:$lastName,number: $number,imagepath:$image,gender:$gender,role:$role,email:$emailId,flatno:$flatNo,blockName:$blockName,ventureName:$floorName,}';                                     
  }
}


  // ignore: unnecessary_new
  UserProfileData newUser= new UserProfileData(); 
   List<UserProfileData> userList =[]; 
   
List<UserProfileData> details = [
  UserProfileData(
    id: '0',
      firstName: "Balaji Muggulla",
      lastName: "muggulla",
      number: '9966704861',
      emailId: "balaji@gmail.com",
      floorName: "Bhapu nagar",
      image: "assets/images/balaji.jpg",
      blockName: "C-Block",
      flatNo: '101',
      gender: "Male",    
      role: 'Staff Member'
      ),
UserProfileData(
  id:'1',
      firstName: "Thrinadh",
      lastName: "talla",
      number: '9966704861',
      emailId: "balaji@gmail.com",
      floorName: "bhapu nagar",
      image: "assets/images/Facebook_logo.png",
      blockName: "C-Block",
      flatNo: '102',
      gender: "male",      
      role: 'staff2'
      ),     
];

