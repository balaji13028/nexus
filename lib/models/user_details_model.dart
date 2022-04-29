import 'package:flutter/material.dart';

class ViewProfileData {
  final String image, fullName, lastName,emailId,ventureName,blockName,gender,roles;
  final int number,flatNo,age;
  ViewProfileData({
    required this.fullName,
    required this.image,
    required this.lastName,
    required this.emailId,
    required this.ventureName,
    required this.blockName,
    required this.number,
    required this.flatNo,
    required this.gender,
    required this.age,
    required this.roles,
  });
}

List<ViewProfileData> details = [
  ViewProfileData(
      fullName: "Balaji Muggulla",
      lastName: "muggulla",
      number: 9966704861,
      emailId: "balaji@gmail.com",
      ventureName: "Bhapu nagar",
      image: "assets/images/balaji.jpg",
      blockName: "C-Block",
      flatNo: 101,
      gender: "Male",
      age: 24,
      roles: 'Staff Member'
      ),
ViewProfileData(
      fullName: "Thrinadh",
      lastName: "talla",
      number: 9966704861,
      emailId: "balaji@gmail.com",
      ventureName: "bhapu nagar",
      image: "assets/images/Facebook_logo.png",
      blockName: "C-Block",
      flatNo: 102,
      gender: "male",
      age: 23,
      roles: 'staff2'
      ),
     
];
