
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_application/models/apartment_model.dart';
import 'package:flutter_application/models/user_details_model.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'models/notice_model.dart';


// <--login page api request starts-->//
 Future<String> userLogin(username, password) async {
    
  
  final response = await http.get(
    Uri.parse('http://192.168.1.20:8080/SpringMVCTemplate/app/getdetails?username=$username&password=$password'));
     

if (response.statusCode == 200) {
  
   // ignore: avoid_print
   print('Response status: ${response.statusCode}');
     
     
 }else {
     // ignore: avoid_print
     print('Request failed with status: ${response.statusCode}.');
   }
 return response.body;
}
// <--login page api request ends-->//


// <--signup page api request starts-->//
  // ignore: non_constant_identifier_names
  Future<String> Signup(fullname,username, phonenumber) async {
 
  
   final response = await http.get(
    Uri.parse('http://192.168.1.20:8080/SpringMVCTemplate/app/signupdetails?fullname=$fullname&username=$username&phonenumber=$phonenumber}'));
     

if (response.statusCode == 200) {
  
    // ignore: avoid_print
    print('Response status: ${response.statusCode}');
      
     
  }else {
   // ignore: avoid_print
   print('Request failed with status: ${response.statusCode}.');
  
     
   }
 return response.body;
}
 //<----signup page api request ends-->


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
if (request.statusCode == 200) {
  
    // ignore: avoid_print
    print('Response status: ${request.statusCode}');
     // print('Response status: ${request.body}');
     
  }else {
   // ignore: avoid_print
   print('Request failed with status: ${request.statusCode}.');
     
   }
 return request.body;
}

// To fatch data from server
Future<List<ApartmentData>> flatResponse() async{
 final response = await http.get(
   Uri.parse(
    'http://192.168.1.20:8080/SpringMVCTemplate/app/getflatdetails'));
     

   if (response.statusCode == 200) {
 // ignore: avoid_print
    print('Response status: ${response.statusCode}');
      //print('Response status: ${response.body}');
         }else {
            // ignore: avoid_print
   print('Request failed with status: ${response.statusCode}.');
  
   }
 
 final List<dynamic> maps = json.decode(response.body);
 // ignore: avoid_print
  //  print(' List of flats are'+maps.toString());

    List<ApartmentData> apartmentslist=  List.generate(maps.length, (i) {
      return ApartmentData (
        id: (maps[i]['id'].toString()),
        relationship: maps[i]['relationship'].toString(),
        name: maps[i]['name'].toString(),
        mobilenumber: maps[i]['mobilenumber'].toString(),
        flatno: maps[i]['flatno'].toString(),
        floor: maps[i]['floor'].toString(),
        
      );
    });
 
  flatList = apartmentslist;
    return apartmentslist;
   
 }
// -<---Flat/apartment module ends----->//

// <---visitors module starts---> //
// to send data to the server 
 visitorApi(String fullname,contactnumber,typeofvisitor,flatno,expectedtime,outtime,outdate,elapsedtime,File image) async {
Map data = {
    'fullname': fullname,
    'contactnumber':contactnumber,
    'typeofvisitor':typeofvisitor,
    'flatno':flatno,
    'expectedtime':expectedtime,
    'outtime':outtime,
    'outdate':outdate,
    'elapsedtime':elapsedtime,
    
    
  };
  //encode Map to JSON
  var body = json.encode(data);
   // ignore: avoid_print
  print('http://192.168.1.20:8080/SpringMVCTemplate/app/visitordetails?visitorDetails=$body'); 

    
     final request =  http.MultipartRequest('POST',
      Uri.parse(
        'http://192.168.1.20:8080/SpringMVCTemplate/app/visitordetails?visitorDetails=$body&image=$image'));
     
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
Future<List<VisitorData>> visitorsResponse() async{
 final response = await http.get(
   Uri.parse(
    'http://192.168.1.20:8080/SpringMVCTemplate/app/getvisitordetails'));
     

   if (response.statusCode == 200) {
 // ignore: avoid_print
    print('Response status: ${response.statusCode}');
   
         }else {
            // ignore: avoid_print
   print('Request failed with status: ${response.statusCode}.');
  
   }
  
 final List<dynamic> maps = json.decode(response.body);
    // ignore: avoid_print
    //print(' List of visitors are'+maps.toString());
    
    
   List<VisitorData> visitlist=  List.generate(maps.length, (i) {
      return VisitorData (
        id: (maps[i]['id'].toString()),
        visitorName: maps[i]['fullname'].toString(),
        visitorNumber: maps[i]['contactnumber'].toString(),
        visitorImage: maps[i]['image'].toString(),
        typeOfVisitor: maps[i]['typeofvisitor'].toString(),
        expectedDuration: maps[i]['expectedtime'].toString(),
        inTime: maps[i]['intime'].toString(),
        inDate: maps[i]['indate'].toString(),
        outTime: maps[i]['outtime'].toString(),
        outDate: maps[i]['outdate'].toString(),
        timeElapsed: maps[i]['elaspedtime'].toString(),
        
        
      );
    });
    
     
    visList = visitlist;
    return visitlist;
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
Future<List<UserProfileData>> usersResponse() async{
 final response = await http.get(
   Uri.parse(
    'http://192.168.1.20:8080/SpringMVCTemplate/app/getuserprofiledetails'));
     

   if (response.statusCode == 200) {
    // ignore: avoid_print
    print('Response status: ${response.statusCode}');
      
         }else {
            // ignore: avoid_print
   print('Request failed with status: ${response.statusCode}.');
  
   }
 
 final List<dynamic> maps = json.decode(response.body);
      // ignore: avoid_print
  // print(' List of users are'+maps.toString());

    List<UserProfileData> userslist=  List.generate(maps.length, (i) {
      return UserProfileData (
        id: (maps[i]['id'].toString()),
        firstName: maps[i]['firstname'].toString(),
        lastName: maps[i]['lastname'].toString(),
        role: maps[i]['role'].toString(),
        number: maps[i]['mobilenumber'].toString(),
        emailId: maps[i]['email'].toString(),
        ventureName: maps[i]['venturename'].toString(),
        flatNo: maps[i]['flatno'].toString(),
        blockName: maps[i]['blockname'].toString(),
        image: maps[i]['image'].toString(),
        gender: maps[i]['gender'].toString(),

      );
    });
    
    userList = userslist;
    return userslist;
  }
 // <---users module ends---> //

// <-- notices module starts-->//
// to send data to the server
Future<String> noticeApi(title,description,startdate,enddate,createdby) async {
 
  
   final request = await http.get(
    Uri.parse(
      'http://192.168.1.20:8080/SpringMVCTemplate/app/noticesdetails?title=$title&description=$description&startdate=$startdate&enddate=$enddate&createdby=$createdby'));
     

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
//to fatch data from server
Future<List<NoticeData>> noticesResponse() async{
 final response = await http.get(
   Uri.parse(
    'http://192.168.1.20:8080/SpringMVCTemplate/app/getnoticesdetails'));
     

   if (response.statusCode == 200) {
   // ignore: avoid_print
    print('Response status: ${response.statusCode}');
     // print('Response status: ${response.body}');
         }else {
            // ignore: avoid_print
   print('Request failed with status: ${response.statusCode}.');
  
   }
 
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
 
