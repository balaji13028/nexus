import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:flutter_application/screens/home_screen.dart';

class  VisitorTimingDetails extends StatelessWidget {
  final VisitorData visitor;

  const VisitorTimingDetails({ Key? key, required this.visitor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
       
    decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(4, 9, 35, 1),
            Color.fromRGBO(39, 105, 171, 1),
          ],
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter
        )
        ),  
           child: 
        Column(   
          mainAxisAlignment:MainAxisAlignment.start ,
          crossAxisAlignment: CrossAxisAlignment.start,                             
             children:[ 
              const Padding(padding: EdgeInsets.only(top: 15)),                   
                Row(
                   children: [
                      Column(      
                     mainAxisAlignment: MainAxisAlignment.start,                                   
                     children: [                       
                       IconButton(icon:const Icon(Icons.arrow_back_sharp,
                       size: 30,
                       color: Colors.white70,
                       ),
                       onPressed: (){
                       Navigator.push(
                        context, MaterialPageRoute(builder: (context) => HomeScreen()));
                       }
                       ),
                     ],
                   ), 
                  Padding(
                   padding: const EdgeInsets.only(left: 41),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,                 
                      children: const [                    
                         Text('Visitor Profile',
                         textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white                        
                        ),
                        ), 
                      ],
                    ),
                 ), 
                   ]
                   ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,                
                  children: [                                          
                    CircleAvatar(                  
                    radius: 65.0,
                    backgroundColor: Colors.white,
                     child:ClipOval(
                       child: Image.file(File(visitor.visitorImage!),
                       fit: BoxFit.cover,width: 125,height: 125,),
                     ),                                             
                    ),
                  ],
              ),
              const SizedBox(height: 10,),                         
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(visitor.visitorName!,
                       style: const TextStyle(
                       fontSize: 22,
                       color: Colors.white,
                       fontWeight: FontWeight.bold,                 
                     ),
                   ),
                  ],
                ),             
               const SizedBox(height: 12,),                         
               Card(
                  margin:const EdgeInsets.symmetric(horizontal: 2.0,vertical: 2,),
                   elevation:2.0,
                   shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
                   child: Container(
                     decoration: BoxDecoration(
                   color: Colors.white38,
                     borderRadius: BorderRadius.circular(10),
                   ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 6, 10),
                     height: 170,
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
                                     color: Colors.indigo,
                                     ),
                                     const SizedBox(width: 30,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                       const Text('Mobile No : ',
                                         style: TextStyle(
                                           fontSize: 12,
                                           color: Colors.black87
                                         ),
                                         ),
                                         Text(visitor.visitorNumber!,
                                         style:const TextStyle(
                                         fontSize: 20,
                                         color: Colors.indigo,                          
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
                                   const Icon(Icons.person,
                                     color: Colors.indigo,
                                     ),
                                     const SizedBox(width: 30,),
                                      Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                         const Text('Type of Visitor :',
                                         style: TextStyle(
                                         fontSize: 12,
                                        color: Colors.black87
                                    ),),
                                       Text(visitor.typeOfVisitor!,
                                       style:  const TextStyle(
                                       fontSize: 20,
                                       color: Colors.indigo,
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
                                   const Icon(Icons.timer,
                                     color: Colors.indigo,
                                     ),
                                     const SizedBox(width: 30,),
                                      Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Expected Duration :',
                                         style: TextStyle(
                                         fontSize: 12,
                                        color: Colors.black87
                                       ),),
                                       Text(visitor.expectedDuration!,
                                       style:  const TextStyle(
                                       fontSize: 20,
                                       color: Colors.indigo,
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
                    SizedBox(height: 10,),
                Card(
                 margin:const EdgeInsets.symmetric(horizontal: 2.0,vertical: 2,),
                   elevation:2.0,
                   shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
                 child: Container(
                     decoration: BoxDecoration(
                     color: Colors.white24,
                     
                     borderRadius: BorderRadius.circular(10),
                   ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 6, 10),
                     height: 185,
                      child: Row(               
                       children: [                                                                            
                          Column(                             
                            crossAxisAlignment: CrossAxisAlignment.start,                 
                              children: [                        
                               Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  children: [
                                   const Icon(Icons.timer,
                                     color: Colors.indigo,
                                     ),
                                     const SizedBox(width: 30,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                       const Text('In Time : ',
                                         style: TextStyle(
                                           fontSize: 12,
                                           color: Colors.black87
                                         ),
                                         ),
                                         Text(visitor.inDate!,
                                         style:const TextStyle(
                                         fontSize: 16,
                                         color: Colors.indigo,                          
                                    ),
                                    ),
                                     Text(visitor.inTime!,
                                         style:const TextStyle(
                                         fontSize: 16,
                                         color: Colors.indigo,                          
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
                                   const Icon(Icons.time_to_leave_sharp,
                                     color: Colors.indigo,
                                     ),
                                     const SizedBox(width: 30,),
                                      Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                         const Text('Out Time:',
                                         style: TextStyle(
                                         fontSize: 12,
                                        color: Colors.black87
                                    ),),
                                       Text(visitor.outDate!,
                                       style:  const TextStyle(
                                       fontSize: 16,
                                       color: Colors.indigo,
                                      ),
                                      ),
                                       Text(visitor.outTime!,                                    
                                       style: const TextStyle(
                                       fontSize: 16,
                                       color: Colors.indigo,
                                      ),
                                     
                                      ),
                                     ],
                                    ), 
                                  ],
                                ),
                              ), 
                             const SizedBox(height: 4,),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  children: [
                                   const Icon(Icons.time_to_leave_rounded,
                                     color: Colors.indigo,
                                     ),
                                     const SizedBox(width: 30,),
                                      Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                         const Text('Time Elapsed:',
                                         style: TextStyle(
                                         fontSize: 12,
                                        color: Colors.black87
                                       ),
                                      ),
                                       Text(visitor.timeElapsed!,
                                       style:const TextStyle(
                                       fontSize: 16,
                                       color: Colors.indigo,
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
               ]
             ),
          
        )
      
    );
  }
}