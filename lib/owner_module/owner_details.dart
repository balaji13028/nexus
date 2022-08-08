import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/user_details_model.dart';

import '../user profile pages/edit_user_profile.dart';
import '../user profile pages/user_profile.dart';

// ignore: must_be_immutable
class OwnerDetails extends StatelessWidget {
  List<UserProfileData> user;

  OwnerDetails({ Key? key ,required this.user,}) : super(key: key);

 

  @override
  Widget build(BuildContext context) { 
    Size size=MediaQuery.of(context).size;  
    var  decodeBytes = base64Decode(user[0].image!);
   
    // ignore: avoid_print
    print('list of users are ${user.length}'); 
    return  Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          
        ),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
         height: size.height*0.14,            
         child: 
          Column(    
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,    
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                   Column(
                     children: [
                       Row(
                         children: [
                           InkWell(                                    
                             onTap: (() {
                               Navigator.push(
                           context, MaterialPageRoute(builder: (context) =>ViewProfile(details:userList[0])));
                             }),
                             child: CircleAvatar(
                              radius: 38.0,
                                backgroundColor: const Color.fromARGB(255, 30, 82, 134),
                               child: CircleAvatar(
                                radius: 36.0,
                                backgroundColor:const Color.fromRGBO(39, 105, 170, 1),
                                 child:ClipOval(
                                            child://( decodeBytes.isEmpty )
                                      //?
                                       Image.asset('assets/images/person.jpg',fit: BoxFit.cover,
                                      //: Image.memory(decodeBytes,fit: BoxFit.cover,width: size.width*0.199,                                                                        
                                    ),
                                  ),   
                               ),
                             ),
                           ),
                        
                                    
                   SizedBox(width: size.width*0.04,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    
                    children:[
                      Row(
                        children:const  [
                          Text('Hi ,',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                          ),
                    ),
                        ],
                      ),
                    Row(
                      children: [                      
                        Column(
                      children: [
                        Text('${user[0].firstName}',
                        style:const  TextStyle(
                          fontSize: 19,
                          letterSpacing: 0.8,
                          color: Colors.indigo,
                          fontWeight: FontWeight.w500
                        ),
                   ),
                      ],
                    ),
                    ],
                    ),
                   
                 ],
                 ),
                 ],
                   ),
                    ],
                       ),
                 
                  InkWell(
                    onTap: () {
                      Navigator.push(
                       context, MaterialPageRoute(builder: (context) => EditProfile(details: userList[0],)));
                      },
                    child: Card(
                     elevation:2.0,
                     shadowColor: Colors.black,
                     shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)), 
                      
                      child: SizedBox(
                        height: size.height*0.07,
                        width: size.width*0.13,
                        child: const Icon(Icons.edit_outlined,
                        size: 28,
                        color: Color.fromARGB(255, 30, 82, 134),
                       ),
                      ),
                      ),
                    ),
                ],                      
              ), 
            ],
          
          ),  
      );
      
    
  }
}