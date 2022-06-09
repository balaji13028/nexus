
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application/models/user_details_model.dart';


// ignore: must_be_immutable
class ViewProfile extends StatelessWidget {
  UserProfileData details;
  ViewProfile({ Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var decodebyte= base64Decode(details.image!);
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Profile'),
        backgroundColor: const Color.fromRGBO(39, 105, 170, 1), 
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        child:Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,                
                children: [
                 
                  CircleAvatar(                  
                  radius: 60.0,
                  backgroundColor: const Color.fromRGBO(39, 105, 170, 1), 
                  child: CircleAvatar(
                  radius: 59,
                  child: ClipOval(
                    child: Image.memory(decodebyte,fit: BoxFit.cover,width: size.width*0.34,),
                  ),
                    
                  ),          
                  ),
                ],
              ),
            const SizedBox(height: 2,),            
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(details.firstName!,
               style: const TextStyle(
                 fontSize: 22,
                 color: Colors.indigo,
                 fontWeight: FontWeight.bold,
                 
               ),
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 
                 Text(details.role!,
                 style: const  TextStyle(
                   fontSize: 18,
                   color: Color.fromARGB(255, 34, 75, 136)
                 ),),
               ],
             ),
             const SizedBox(height: 2,),                         
             Card(
               margin:const EdgeInsets.symmetric(horizontal: 2.0,vertical: 2,),
                 elevation:2.0,
                 shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
               child: Container(
                   decoration: BoxDecoration(
                   color: Colors.deepPurple,
                   gradient:const  LinearGradient(
                       begin: Alignment.topLeft,
                       end: Alignment.topRight,
                       colors:[
                          Color.fromARGB(255, 100, 179, 231),
                          Color.fromARGB(255, 188, 105, 226),
                        ]
                     ),
                   borderRadius: BorderRadius.circular(10),
                 ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 6, 10),
                   height: 165,
                  child: Row(               
                    children: [                                                                            
                        Column(    
                         
                          crossAxisAlignment: CrossAxisAlignment.start,                 
                          children: [                        
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                 const Icon(Icons.phone,
                                   color: Colors.white70,
                                   ),
                                   const SizedBox(width: 30,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Mobile No : ',
                                       style: TextStyle(
                                         fontSize: 12,
                                         color: Colors.white70
                                       ),
                                       ),
                                       Text("${details.number}",                        
                                       style:const TextStyle(
                                       fontSize: 20,
                                       color: Colors.white70,                          
                                  ),
                                  ),
                                  ],
                                ),
                                  
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                 const Icon(Icons.mail_outline,
                                   color: Colors.white70,
                                   ),
                                   const SizedBox(width: 30,),
                                    Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      const   Text('Email ID :  ',
                                       style: TextStyle(
                                       fontSize: 12,
                                      color: Colors.white70
                                  ),),
                                     Text(details.emailId!,
                                     style: const TextStyle(
                                     fontSize: 20,
                                     color: Colors.white70,
                                  ),
                                  ),
                                      ],
                                    ),
                                  
                                ],
                              ),
                            ),
                            const SizedBox(height: 12,),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                 const Icon(Icons.person,
                                   color: Colors.white70,
                                   ),
                                   const SizedBox(width: 30,),
                                    Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Gender :  ',
                                       style: TextStyle(
                                       fontSize: 12,
                                      color: Colors.white70
                                  ),),
                                     Text(details.gender!,
                                     style: const TextStyle(
                                     fontSize: 20,
                                     color: Colors.white70,
                                  ),
                                  ),
                                      ],
                                    ),
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      
                    ],
                  ),
                ),
             ),
             
           
            const SizedBox(height: 10,),
            Card(
              margin:const EdgeInsets.symmetric(horizontal: 2.0,vertical: 1,),
      elevation:2.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
              child: Container(
                 decoration: BoxDecoration(
                 color: Colors.deepPurple,
                 gradient:const  LinearGradient(
                     begin: Alignment.topLeft,
                     end: Alignment.topRight,
                     colors:[
                        Color.fromARGB(255, 100, 179, 231),
                        Color.fromARGB(255, 188, 105, 226),
                      ]
                   ),
                 borderRadius: BorderRadius.circular(10),
               ),
                padding: const EdgeInsets.fromLTRB(20, 10, 6, 10),
                 height: 
                 175,
                child: Row(               
                  children: [                                                                            
                      Column(                      
                        crossAxisAlignment: CrossAxisAlignment.start,                 
                        children: [                        
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(Icons.house_rounded,
                                 color: Colors.white70,
                                 ),
                                 const SizedBox(width: 30,),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                    const Text('Flat No :',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white70
                                    ),),
                                    Text("${details.flatNo}",                        
                                style:const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white70,                          
                                ),
                                ),
                                 ],
                               ),
                                
                              ],
                            ),
                          ),
                          const SizedBox(height: 12,),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(Icons.house_rounded,
                                 color: Colors.white70,
                                 ),
                                 const SizedBox(width: 30,),
                                 Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     const Text('Block Name :  ',
                                style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white70
                                ),
                                ),
                                 Text("${details.blockName}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                                ),
                                   ],
                                 ),
                               
                              ],
                            ),
                          ),
                         const SizedBox(height: 12,),
                         Padding(
                           padding: const EdgeInsets.all(2.0),
                           child: Row(
                             children: [
                               const Icon(Icons.house_rounded,
                                 color: Colors.white70,
                                 ),
                                 const SizedBox(width: 30,),
                               Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   const Text('Venture Name: ',
                                     style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white70
                                     ),
                                    ),
                                  Text(details.ventureName!,
                                    style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70
                                   ),
                                  ),
                                 ],
                               ),
                               
                             ],
                           ),
                         ),
                        ],
                      ),
                    
                  ],
                ),
              ),
            )
            
          ],
        )
      )
    );
  }
}