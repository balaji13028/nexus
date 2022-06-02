import 'package:flutter/material.dart';

class SignupData {
   
   String fullname;
   String username;
   String password;

  SignupData({
    
    required this.fullname,
    required this.username,
    required this.password,
  }
  );
 
  factory SignupData.fromJson(Map<String, dynamic> json) {
    return SignupData( 
      fullname:json['fullname'],
       username:json['username'], 
       password:json['password'],
       );
  }
}