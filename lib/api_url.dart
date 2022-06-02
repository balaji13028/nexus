
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application/models/apartment-model.dart';
import 'package:flutter_application/models/user_details_model.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'models/notice_model.dart';


// <--login page api request starts-->//
 Future<String> userLogin(username, password) async {
    
  
  final response = await http.get(
    Uri.parse('http://192.168.1.20:8080/SpringMVCBoilerplate/app/getdetails?username=${username}&password=${password}'));
     

if (response.statusCode == 200) {
  
   print('Response status: ${response.statusCode}');
     print('Response status: ${response.body}');
     
 }else {
     print('Request failed with status: ${response.statusCode}.');
   }
 return response.body;
}
// <--login page api request ends-->//


// <--signup page api request starts-->//
  Future<String> Signup(fullname,username, phonenumber) async {
 
  
   final response = await http.get(
    Uri.parse('http://192.168.1.20:8080/SpringMVCBoilerplate/app/signupdetails?fullname=${fullname}&username=${username}&phonenumber=${phonenumber}'));
     

if (response.statusCode == 200) {
  
    print('Response status: ${response.statusCode}');
      print('Response status: ${response.body}');
     
  }else {
   print('Request failed with status: ${response.statusCode}.');
  print('Response status: ${response.body}');
     
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
  print('http://192.168.1.20:8080/SpringMVCBoilerplate/app/flatdetails?json=$body');

   final response = await http.get(
    Uri.parse(
      'http://192.168.1.20:8080/SpringMVCBoilerplate/app/flatdetails?json=$body'),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      },
      
      
      );
if (response.statusCode == 200) {
  
    print('Response status: ${response.statusCode}');
      print('Response status: ${response.body}');
     
  }else {
   print('Request failed with status: ${response.statusCode}.');
     
   }
 return response.body;
}

// To fatch data from server
Future<List<ApartmentData>> flatResponse() async{
 final response = await http.get(
   Uri.parse(
    'http://192.168.1.20:8080/SpringMVCBoilerplate/app/getflatdetails'));
     

   if (response.statusCode == 200) {
  
    print('Response status: ${response.statusCode}');
      //print('Response status: ${response.body}');
         }else {
   print('Request failed with status: ${response.statusCode}.');
  
   }
 
 final List<dynamic> maps = json.decode(response.body);

    print(' List of flats are'+maps.toString());

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
    'image':image.toString(),
    
  };
  //encode Map to JSON
  var body = json.encode(data);
  print('http://192.168.1.20:8080/SpringMVCBoilerplate/app/flatdetails?visitorDetails=$body'); 

 var stream =  http.ByteStream(image.openRead());
       var length = await image.length();
  Map<String, String> headers = {
      "Accept": "application/json",
    
    }; 
    final response =  http.MultipartRequest('GET',
     Uri.parse(
       'http://192.168.1.20:8080/SpringMVCBoilerplate/app/visitordetails?visitorDetails=$body'));
     
 var multipartFile = http.MultipartFile('image',stream,length,                        
           filename: basename(image.path));
           response.files.add(multipartFile);
       var res = await response.send();
       print(res.statusCode);
       res.stream.transform(utf8.decoder).listen((value) {
         print(value);
       });

 //final response = await http.get(
 //    Uri.parse(
  //     'http://192.168.1.20:8080/SpringMVCBoilerplate/app/flatdetails?json=$body'),
  //     headers: <String, String>{
 //      'Content-Type': 'application/json; charset=UTF-8',
 //    },
      
      
//       );
//  if (response.statusCode == 200) {
  
//     print('Response status: ${response.statusCode}');
//       print('Response status: ${response.body}');
     
//  }else {
//    print('Request failed with status: ${response.statusCode}.');
  
     
//    }
 
 //return response.body;
}

//  To fatch data from server
Future<List<VisitorData>> visiorsResponse() async{
 final response = await http.get(
   Uri.parse(
    'http://192.168.1.20:8080/SpringMVCBoilerplate/app/getvisitordetails'));
     

   if (response.statusCode == 200) {
  
    print('Response status: ${response.statusCode}');
      print('Response status: ${response.body}');
         }else {
   print('Request failed with status: ${response.statusCode}.');
  
   }
 
 final List<dynamic> maps = json.decode(response.body);

    print(' List of visitors are'+maps.toString());

   List<VisitorData> visitlist=  List.generate(maps.length, (i) {
      return VisitorData (
        id: (maps[i]['id'].toString()),
        visitorName: maps[i]['name'].toString(),
        visitorNumber: maps[i]['number'].toString(),
        visitorImage: maps[i]['imagepath'].toString(),
        typeOfVisitor: maps[i]['type'].toString(),
        expectedDuration: maps[i]['duration'].toString(),
        inTime: maps[i]['intime'].toString(),
        inDate: maps[i]['inDate'].toString(),
        outTime: maps[i]['outtime'].toString(),
        outDate: maps[i]['outdate'].toString(),
        timeElapsed: maps[i]['elasped'].toString(),

      );
    });
    
    visList = visitlist;
    return visitlist;
  }
 // <---visitors module ends---> //

// <---users module starts---> //
//users api request
Future<String> userApi(firstname,lastname,role,mobilenumber,email,image,venturename,block,flatno,gender) async {
 
  
   final response = await http.get(
    Uri.parse(
      'http://192.168.1.20:8080/SpringMVCBoilerplate/app/userprofiledetails?firstname=$firstname&lastname=$lastname&role=$role&mobilenumber=$mobilenumber&email=$email&image=$image&venturename=$venturename&block=$block&flatno=$flatno&gender=$gender'));
     

if (response.statusCode == 200) {
  
    print('Response status: ${response.statusCode}');
      print('Response status: ${response.body}');
     
  }else {
   print('Request failed with status: ${response.statusCode}.');
  
     
   }
 return response.body;
}
//  To fatch data from server
Future<List<UserProfileData>> usersResponse() async{
 final response = await http.get(
   Uri.parse(
    'http://192.168.1.20:8080/SpringMVCBoilerplate/app/getuserprofiledetails'));
     

   if (response.statusCode == 200) {
  
    print('Response status: ${response.statusCode}');
      print('Response status: ${response.body}');
         }else {
   print('Request failed with status: ${response.statusCode}.');
  
   }
 
 final List<dynamic> maps = json.decode(response.body);

   print(' List of users are'+maps.toString());

    List<UserProfileData> userslist=  List.generate(maps.length, (i) {
      return UserProfileData (
        id: (maps[i]['id'].toString()),
        firstName: maps[i]['firstname'].toString(),
        lastName: maps[i]['lastname'].toString(),
        role: maps[i]['role'].toString(),
        number: maps[i]['number'].toString(),
        emailId: maps[i]['email'].toString(),
        ventureName: maps[i]['ventureName'].toString(),
        flatNo: maps[i]['flatno'].toString(),
        blockName: maps[i]['blockName'].toString(),
        image: maps[i]['imagepath'].toString(),
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
 
  
   final response = await http.get(
    Uri.parse(
      'http://192.168.1.20:8080/SpringMVCBoilerplate/app/noticesdetails?title=$title&description=$description&startdate=$startdate&enddate=$enddate&createdby=$createdby'));
     

if (response.statusCode == 200) {
  
    print('Response status: ${response.statusCode}');
      print('Response status: ${response.body}');
     
  }else {
   print('Request failed with status: ${response.statusCode}.');
  
     
   }
 return response.body;
}
//to fatch data from server
Future<List<NoticeData>> noticesResponse() async{
 final response = await http.get(
   Uri.parse(
    'http://192.168.1.20:8080/SpringMVCBoilerplate/app/getnoticesdetails'));
     

   if (response.statusCode == 200) {
  
    print('Response status: ${response.statusCode}');
     // print('Response status: ${response.body}');
         }else {
   print('Request failed with status: ${response.statusCode}.');
  
   }
 
 final List<dynamic> maps = json.decode(response.body);

  print(' List of notices are'+maps.toString());

    List<NoticeData> noticelist=  List.generate(maps.length, (i) {
      return NoticeData (
        id: (maps[i]['id'].toString()),
        title: maps[i]['title'].toString(),
        description: maps[i]['description'].toString(),
        startDate: maps[i]['startDate'].toString(),
        endDate: maps[i]['endDate'].toString(),
        createdby: maps[i]['createdby'].toString(),
       
      );
    });
    
    noticeList = noticelist;
    return noticelist;
  }
 // <---notices module ends---> //





   