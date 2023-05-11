
class ApartmentData {
   String ? id, name,role,mobilenumber,flatno,floor,block;
  
  ApartmentData({
    this.id,
    this.name,    
    this.role,
    this.mobilenumber,
    this.flatno,
    this.floor,
    this.block
  });

   Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name':name,
      'relationship':role,
      'mobilenumber': mobilenumber,
      'flatno':flatno,
      'whichfloor':floor,
      'block':block
     
    };
  }
   @override
  String toString() {
    return 'ApartmentDetails{id: $id, name:$name,role:$role,mobilenumber: $mobilenumber,flatno:$flatno,floor:$floor,block:$block}';                                     
  }


}

 // ignore: unnecessary_new
  ApartmentData newFlat= new ApartmentData(); 
  List<ApartmentData> flatList =[];
  
