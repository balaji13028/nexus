
import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_application/models/apartment_model.dart';
import 'package:flutter_application/models/user_details_model.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'models/notice_model.dart';


/// <--login page api request starts-->
 Future<String> userLogin(phonenumber) async {
    
  
  final response = await http.get(
    Uri.parse('http://192.168.1.20:8080/SpringMVCTemplate/nexusapp/generateOtp?phonenumber=$phonenumber'));
    print('login number is $phonenumber');
     

if (response.statusCode == 200) {
  
   
  // print('Response status: ${response.statusCode}');
  // ignore: avoid_print
    print('login otp is ${response.body}'); 
     
 }else {
     // ignore: avoid_print
     print('Request failed with status: ${response.statusCode}.');
   }
 return response.body;
}
// <--login page api request ends-->//



Future<String> userRoleApi(phonenumber) async {
    
  
  final response = await http.get(
    Uri.parse('http://192.168.1.20:8080/SpringMVCTemplate/nexusapp/getRole?phonenumber=$phonenumber'));
     

if (response.statusCode == 200) {
  
   
  // print('Response status: ${response.statusCode}');
  // ignore: avoid_print
    print('user role is ${response.body}'); 
     
 }else {
     // ignore: avoid_print
     print('Request failed with status: ${response.statusCode}.');
   }
 return response.body;
}


// <--otp verification api request starts-->//
  // ignore: non_constant_identifier_names
  Future<String> Verifyapi(num1,num2,num3,num4,num5,phonenumber) async {
   String otp='$num1$num2$num3$num4$num5';
  

   final response = await http.get(
    Uri.parse('http://192.168.1.20:8080/SpringMVCTemplate/nexusapp/validateOtp?otp=$otp&phonenumber=$phonenumber'));
     

if (response.statusCode == 200) {
  
    
    //print('Response status: ${response.statusCode}');
    // ignore: avoid_print
    print('Response status: ${response.body}');  
     
  }else {
   // ignore: avoid_print
   print('Request failed with status: ${response.statusCode}.');
  
     
   }
 return response.body;
}
 //<----otp verification api request ends-->


// <----Flat/apartment module starts----->
// To send data into server through json formate.
Future<String> flatApi(String name,mobilenumber,relationship,floor,flatno) async {
  
Map data = {
    'name': name,
    'mobilenumber':mobilenumber,
    'relationship':relationship,
    'floor':floor,
    'flatno':flatno
  };
  //encode Map to JSON
  var body = json.encode(data);
  
   final request = await http.get(
    Uri.parse(
      'http://192.168.1.20:8080/SpringMVCTemplate/app/flatdetails?json=$body'),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      },
      
      
      );

 return request.body;
}

// To fatch data from server
Future<List<ApartmentData>> flatResponse() async{
 final response = await http.get(
   Uri.parse(
    'http://192.168.1.20:8080/SpringMVCTemplate/nexusapp/getApartmentDetails'));
      
 final List<dynamic> maps = json.decode(response.body);
 // ignore: avoid_print
  print(' List of flats are'+maps.toString());

    List<ApartmentData> apartmentslist=  List.generate(maps.length, (i) {
      return ApartmentData (
        id: (maps[i]['appartmentId'].toString()),
        role: maps[i]['appartmentOwner'].toString(),
        name: maps[i]['userName'].toString(),
        mobilenumber: maps[i]['userMobile'].toString(),
        flatno: maps[i]['appartmentName'].toString(),
        floor: maps[i]['floorId'].toString(),
        block: maps[i]['blockId'].toString(),
        
      );
    });
 
  flatList = apartmentslist;
    return apartmentslist;
   
 }
// -<---Flat/apartment module ends----->//

// <---visitors module starts---> //
/// to send data to the server 
 visitorApi(String typeOfVisitor,apartmentName,blockName,name,mobile,expectedTime,outTime,outDate,elapsedTime,File image) async {
Map data = {
    'name': name,
    'mobile':mobile,
    'typeOfVisitor':typeOfVisitor,
    'apartmentName':apartmentName,
    'blockName':blockName,
    'expectedTime':expectedTime,
    'outTime':outTime,
    'outDate':outDate,
    'elapsedTime':elapsedTime,
    
    
  };
  //encode Map to JSON
  var visitorDetails = json.encode(data);
  
   
     final request =  http.MultipartRequest('POST',
      Uri.parse(
        'http://192.168.1.20:8080/SpringMVCTemplate/nexusapp/addVisitor&VisitorDetails?visitorDetails=$visitorDetails&imagePath=$image'));
     
  var multipartFile = await http.MultipartFile.fromPath('imagePath',image.path,                        
       contentType: MediaType('image','jpeg'),filename: basename(image.path));
            request.files.add(multipartFile);
        var res = await request.send();
         // ignore: avoid_print
        print(res.statusCode);
        res.stream.transform(utf8.decoder).listen((value) {
           // ignore: avoid_print
          print(value);
      });


}

// / To fatch data from server
Future<List<VisitorData>> visitorsResponse() async{
 final response = await http.get(
   Uri.parse(
    'http://192.168.1.20:8080/SpringMVCTemplate/nexusapp/getVisitorsDetails'));
     

  
  
 final List<dynamic> maps = json.decode(response.body);
    // ignore: avoid_print
   //print(' List of visitors are'+maps.toString());
    
    
   List<VisitorData> visitlist=  List.generate(maps.length, (i) {
      return VisitorData (
        id: (maps[i]['id'].toString()),
        visitorName: maps[i]['name'].toString(),
        visitorNumber: maps[i]['mobile'].toString(),
        visitorImage: maps[i]['imagePath'].toString(),
        typeOfVisitor: maps[i]['typeOfVisitor'].toString(),
        expectedDuration: maps[i]['expectedTime'].toString(),
        blockname: maps[i]['blockName'].toString(),
        apartmentName: maps[i]['appartmentName'].toString(),
        inTime: maps[i]['inTime'].toString(),
        inDate: maps[i]['inDate'].toString(),
        outTime: maps[i]['outTime'].toString(),
        outDate: maps[i]['outDate'].toString(),
        timeElapsed: maps[i]['elaspedTime'].toString(),
        
        
      );
    });
    
    
    visList = visitlist;
    return visitlist;
  }

  Future visitorExited(String id,outTime,outDate,elapsedTime)async{
    Map exitdetails={
      'id':id,
      'outTime':outTime,
      'outDate':outDate,
      'elapsedTime':elapsedTime,        
  };
  //encode Map to JSON
  var exitedDetails = json.encode(exitdetails);
    
     final request = await http.post(
      Uri.parse(
        'http://192.168.1.20:8080/SpringMVCTemplate/nexusapp/exitedvisitorDetails?exitedvisitorDetails=$exitedDetails'));
        return request.body;
  }
 // <---visitors module ends---> //

// <---users module starts---> //
//users api request
userApi(firstname,lastname,role,mobilenumber,email,venturename,block,flatno,gender,File image) async {
 Map details={
   'firstname':firstname,
      'lastname':lastname,
      'number': mobilenumber,     
      'role':role,
      'email':email,
      'flatno':flatno,
      'blockName' :block,
      'ventureName':venturename,
      'gender':gender,
 };
   var body=json.encode(details);
  final request =  http.MultipartRequest('POST',
      Uri.parse(
        'http://192.168.1.20:8080/SpringMVCTemplate/app/userprofiledetails?userProfile=$body&image=$image'));
     
  var multipartFile = await http.MultipartFile.fromPath('image',image.path,                        
       contentType: MediaType('image','jpeg'),filename: basename(image.path));
            request.files.add(multipartFile);
        var res = await request.send();
         // ignore: avoid_print
        print(res.statusCode);
        res.stream.transform(utf8.decoder).listen((value) {
           // ignore: avoid_print
          print(value);
      });
}

//  To fatch data from server
Future<List<UserProfileData>> usersResponse(phonenumber) async{
 final response = await http.get(
   Uri.parse(
    'http://192.168.1.20:8080/SpringMVCTemplate/nexusapp/getUserDetails?phonenumber=$phonenumber'));
     
  print('user dat is ${response.statusCode}');
  
 final List<dynamic> maps = json.decode(response.body);
      // ignore: avoid_print
     //print(' List of users are'+maps.toString());

    List<UserProfileData> userslist=  List.generate(maps.length, (i) {
      return UserProfileData (
        id: (maps[i]['userId'].toString()),
        firstName: maps[i]['userName'].toString(),
        lastName: maps[i]['userFullName'].toString(),
        role: maps[i]['userRole'].toString(),
        number: maps[i]['userMobile'].toString(),
        emailId: maps[i]['userEmail'].toString(),
        floorName: maps[i]['floorId'].toString(),
        flatNo: maps[i]['appartmentName'].toString(),
        blockName: maps[i]['blockId'].toString(),
        image: maps[i]['image'].toString(),
        gender: maps[i]['gender'].toString(),

      );
    });
    
    userList = userslist;
    return userslist;
  }

  Future editUserProfile(String id,lastname,emailid,gender,File image)async{
    Map edituser={
      'userId':id,      
      'userFullName':lastname,
      'userEmail':emailid,
      'gender': gender        
  };
  //encode Map to JSON
  var edituserdetails = json.encode(edituser);
  
     final request =  http.MultipartRequest('POST',
      Uri.parse(
        'http://192.168.1.20:8080/SpringMVCTemplate/nexusapp/editUserDetails?userProfileDetails=$edituserdetails&image=$image'));
      
        var multipartFile = await http.MultipartFile.fromPath('image',image.path,                        
       contentType: MediaType('image','jpeg'),filename: basename(image.path));
            request.files.add(multipartFile);
        var res = await request.send();
         // ignore: avoid_print
        print(res.statusCode);
        res.stream.transform(utf8.decoder).listen((value) {
           // ignore: avoid_print
          print(value);
      });
  }
 // <---users module ends---> //

// <-- notices module starts-->//
// to send data to the server
Future<String> noticeApi(title,description,startdate,enddate,createdby) async {
 
  
   final request = await http.get(
    Uri.parse(
      'http://192.168.1.20:8080/SpringMVCTemplate/app/noticesdetails?title=$title&description=$description&startdate=$startdate&enddate=$enddate&createdby=$createdby'));
     


 return request.body;
}
//to fatch data from server
Future<List<NoticeData>> noticesResponse() async{
 final response = await http.get(
   Uri.parse(
    'http://192.168.1.20:8080/SpringMVCTemplate/app/getnoticesdetails'));
     
 final List<dynamic> maps = json.decode(response.body);
   // ignore: avoid_print
 // print(' List of notices are'+maps.toString());

    List<NoticeData> noticelist=  List.generate(maps.length, (i) {
      return NoticeData (
        id: (maps[i]['id'].toString()),
        title: maps[i]['title'].toString(),
        description: maps[i]['description'].toString(),
        startDate: maps[i]['startdate'].toString(),
        endDate: maps[i]['enddate'].toString(),
        createdby: maps[i]['createdby'].toString(),
       
      );
    });
    
    noticeList = noticelist;
    return noticelist;
  }

 // <---notices module ends---> //
 

// <---transactions module starts---> //
//transactions api request
txnApi(String txnid,responseCode,txnrefId,status,approvalRef) async {
 Map details={
   'transactionId':txnid,
      'responseCode':responseCode,
      'transactionsrefid': txnrefId,     
      'status':status,
      'approvalRefNo':approvalRef,
     
 };
   var body=json.encode(details);
  final request = await http.get(
      Uri.parse(
        'http://192.168.1.20:8080/SpringMVCTemplate/app/userprofiledetails?transactionDetails=$body'));

     if (request.statusCode == 200) {
   // ignore: avoid_print
    print('Response status: ${request.statusCode}');
     // ignore: avoid_print
     // print('Response status: ${request.body}');
     
  }else {
     // ignore: avoid_print
   print('Request failed with status: ${request.statusCode}.');
  
}
return request.body;
}