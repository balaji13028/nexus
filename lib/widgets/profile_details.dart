import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/user_details_model.dart';

// ignore: must_be_immutable
class ProfileDetails extends StatelessWidget {
  List<UserProfileData> user;

  ProfileDetails({ Key? key ,required this.user,}) : super(key: key);

 

  @override
  Widget build(BuildContext context) { 
    Size size=MediaQuery.of(context).size;  
    var  decodeBytes = base64Decode(user[0].image!);
   
    // ignore: avoid_print
    print('list of users are ${user.length}'); 
    return Card(      
      margin:const EdgeInsets.symmetric(horizontal: 14.0,vertical: 4,),
      elevation:6.0,
      shadowColor: Colors.white,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),      
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
         height: size.height*0.12,            
         child: 
          Column(        
            children: [
              Row(            
                children:[
                   CircleAvatar(
                    radius: 32.0,
                    backgroundColor:const Color.fromRGBO(39, 105, 170, 1),
                     child:ClipOval(
                                child:( decodeBytes== null )
                          ? Image.asset('assets/images/person.jpg')
                          : Image.memory(decodeBytes,fit: BoxFit.cover,width: size.width*0.178,                                                                        
                        ),
                                 
                                 
                               ),   
                   ),               
                   SizedBox(width: size.width*0.04,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Row(
                        children:const  [
                          Text('Hello',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                          ),
                    ),
                        ],
                      ),
                    Row(
                      children: [
                        Column(
                          children:const  [
                            Text('I am : ',
                            style:TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                            ),
                   ),
                          ],
                        ),
                      
                     Column(
                      children: [
                        Text('${user[0].firstName} ${user[0].lastName}',
                        style:const  TextStyle(
                          fontSize: 18,
                          color: Colors.indigo,
                          fontWeight: FontWeight.w500
                        ),
                   ),
                      ],
                    ),
                    ],
                    ),
                   Row(
                      children: [
                        Column(
                          children:const  [
                            Text('Role : ',
                            style:TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                            ),
                   ),
                          ],
                        ),
                      
                     Column(
                      children: [
                        Text('${user[0].role}',
                        style:const  TextStyle(
                          fontSize: 16,
                          color: Colors.purple,
                          fontWeight: FontWeight.w500
                        ),
                   ),
                      ],
                    ),
                    ],
                    ),
                 ],
                 ),
                 SizedBox(width: size.width*0.05),
                  IconButton(
                     icon:const Icon(Icons.edit),
                     iconSize: 28.0,
                     color: Colors.grey,
                     onPressed: () {
                      
                     },
                  ),
                 
                ],                      
              ),                                               
            ],
          
                      ),
                       ),
                        
                       
                       
      );
      
    
  }
}