
class ApartmentData {
   String ? id, name,relationship,mobilenumber,flatno,floor;
  
  ApartmentData({
    this.id,
    this.name,    
    this.relationship,
    this.mobilenumber,
    this.flatno,
    this.floor,
  });

   Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name':name,
      'relationship':relationship,
      'mobilenumber': mobilenumber,
      'flatno':flatno,
      'whichfloor':floor,
     
    };
  }
   @override
  String toString() {
    return 'ApartmentDetails{id: $id, name:$name,relationship:$relationship,mobilenumber: $mobilenumber,flatno:$flatno,floor:$floor,}';                                     
  }


}

 // ignore: unnecessary_new
  ApartmentData newFlat= new ApartmentData(); 
  List<ApartmentData> flatList =[];
  
