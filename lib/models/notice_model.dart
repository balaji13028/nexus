import 'package:flutter/material.dart';

class NoticeData{
String ? id,title,description,startDate,endDate,createdby;


NoticeData({
  this.title,
  this.id,
  this.description,
  this.startDate,
  this.endDate,
  this.createdby
});

Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title':title,
      'description':description,
      'startDate': startDate,
      'endDate':endDate,
      'createdby':createdby,
      
    };
  }
  

   @override
  String toString() {
    return 'UserProfileData{id: $id, title: $title,description:$description,startDate: $startDate,endDate:$endDate,createdby:$createdby,}';                                     
  }
}


  NoticeData newNotice= new NoticeData(); 
   List<NoticeData> noticeList =[]; 