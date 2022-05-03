import 'package:flutter/material.dart';

class VisitorData{
  String visitorName,
  visitorNumber,
  typeOfVisitor,
  expectedDuration,
  inTime,
  outTime,
  timeElapsed;
  
  VisitorData({
    required this.visitorName,
    required this.visitorNumber,
    required this.typeOfVisitor,
    required this.expectedDuration,
    required this.inTime,
    required this.outTime,
    required this.timeElapsed
  });
}