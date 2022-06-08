
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:flutter_application/visistors%20page/visitor_out_time_details.dart';
import 'package:intl/intl.dart';



// ignore: must_be_immutable
class ViewVisitorProfile extends StatefulWidget {
  VisitorData visitor;

ViewVisitorProfile({ Key? key, required this.visitor,}) : super(key: key);

  @override
  State<ViewVisitorProfile> createState() => _ViewVisitorProfileState();
}

class _ViewVisitorProfileState extends State<ViewVisitorProfile> {
  
 // ignore: prefer_typing_uninitialized_variables
 var intime;
 var decodeBytes;
 String _timeasString = DateTime.now().toString();

Timer ?_timer;
String outtimer='';
String outdater='';

@override 
void initState() {
 decodeBytes = base64Decode(widget.visitor.visitorImage!);


  var stringdateandtime= ('${widget.visitor.inDate!} ${widget.visitor.inTime!}');
  /* now convert date and time string to datetime format */
  intime=DateTime.parse(stringdateandtime);
  print('time 2 is $intime');

  _timeasString = DateFormat("kk:mm:ss").format(intime);
   
      _timer=Timer.periodic(const Duration(seconds: 1),( Timer t){
       _getDuration(intime);
     }    
    );
     super.initState();
   }

 void _getDuration(time){

 Duration timeelapsed = DateTime.now().difference(time);

 if(!mounted) return;
     setState(() {
      _timeasString = timeelapsed.toString().split(".")[0];
      
      // _timeasInt = timeelapsed.inMinutes;   

     });               
 
 }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor Profile'),      
        centerTitle: true,
        backgroundColor:const Color.fromRGBO(39, 105, 170, 1), 
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,),
        color: Colors.grey,
        child: ListView(
          children:[
             Column(                       
            children:[ 
             const Padding(padding: EdgeInsets.only(top: 25)),           
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,                
                  children: [                                  
                    CircleAvatar(                  
                    radius: 65.0,
                   backgroundColor:Colors.black,
                     child:ClipOval(
                       child: (widget.visitor.visitorImage == null)? Image.asset('assets/images/person.jpg'): Image.memory(decodeBytes,
                       fit: BoxFit.cover,width: 125,height: 125,),
                     ),                                             
                    ),
                  ],
                ),
              const SizedBox(height: 10,),                         
                   Text(widget.visitor.visitorName!,
                   style: TextStyle(
                   fontSize: 22,
                   letterSpacing: 1.1,
                   color: Colors.blue.shade900,
                   fontWeight: FontWeight.bold,                 
                 ),
                 ),             
               const SizedBox(height: 10,),                         
               Card(
                 margin:const EdgeInsets.symmetric(horizontal: 2.0,vertical: 2,),
                   elevation:2.0,
                   shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
                 child: Container(
                     decoration: BoxDecoration(
                     color: Colors.deepPurple,
                     gradient:const  LinearGradient(
                         begin: Alignment.bottomLeft,
                         end: Alignment.topCenter,
                         colors:[
                           Color.fromRGBO(4, 9, 35, 1),
                           Color.fromRGBO(39, 105, 171, 1),
                          ]
                       ),
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
                                     color: Colors.white70,
                                     ),
                                     const SizedBox(width: 30,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                       const Text('Mobile No : ',
                                         style: TextStyle(
                                           fontSize: 12,
                                           color: Colors.white70
                                         ),
                                         ),
                                         Text(widget.visitor.visitorNumber!,
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
                                   const Icon(Icons.person,
                                     color: Colors.white70,
                                     ),
                                     const SizedBox(width: 30,),
                                      Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                         const Text('Type of Visitor :',
                                         style: TextStyle(
                                         fontSize: 12,
                                        color: Colors.white70
                                    ),),
                                       Text(widget.visitor.typeOfVisitor!,
                                       style:  const TextStyle(
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
                                   const Icon(Icons.timer,
                                     color: Colors.white70,
                                     ),
                                     const SizedBox(width: 30,),
                                      Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Expected Duration :',
                                         style: TextStyle(
                                         fontSize: 12,
                                        color: Colors.white70
                                       ),),
                                       Text(widget.visitor.expectedDuration!,
                                       style:  const TextStyle(
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
                   Card(
                 margin:const EdgeInsets.symmetric(horizontal: 2.0,vertical: 2,),
                   elevation:2.0,
                   shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
                 child: Container(
                     decoration: BoxDecoration(
                     color: Colors.deepPurple,
                     gradient:const  LinearGradient(
                         begin: Alignment.bottomLeft,
                         end: Alignment.topCenter,
                         colors:[
                           Color.fromRGBO(4, 9, 35, 1),
                           Color.fromRGBO(39, 105, 171, 1),
                          ]
                       ),
                     borderRadius: BorderRadius.circular(10),
                   ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 6, 10),
                     height: 190,
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
                                     color: Colors.white70,
                                     ),
                                     const SizedBox(width: 30,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                       const Text('In Time : ',
                                         style: TextStyle(
                                           fontSize: 12,
                                           color: Colors.white70
                                         ),
                                         ),
                                         Text(widget.visitor.inDate!,
                                         style:const TextStyle(
                                         fontSize: 16,
                                         color: Colors.white70,                          
                                    ),
                                    ),
                                     Text(widget.visitor.inTime!,
                                         style:const TextStyle(
                                         fontSize: 18,
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
                                   const Icon(Icons.time_to_leave_sharp,
                                     color: Colors.white70,
                                     ),
                                     const SizedBox(width: 30,),
                                      Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                         const Text('Out Time:',
                                         style: TextStyle(
                                         fontSize: 12,
                                        color: Colors.white70
                                    ),),
                                       Text(widget.visitor.outDate!,
                                       style:  const TextStyle(
                                       fontSize: 16,
                                       color: Colors.white70,
                                      ),
                                      ),
                                       Text(widget.visitor.outTime!,                                    
                                       style: const TextStyle(
                                       fontSize: 18,
                                       color: Colors.white70,
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
                                     color: Colors.white70,
                                     ),
                                     const SizedBox(width: 30,),
                                      Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                         const Text('Time Elapsed:',
                                         style: TextStyle(
                                         fontSize: 12,
                                        color: Colors.white70
                                    ),),
                                       Text(_timeasString,
                                       style: const TextStyle(
                                       fontSize: 16,
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
                   const  SizedBox(height: 30,),
                    Container(
                      height: 38,
                      width: 140,
                      child: ElevatedButton(                                        
                        child:const Text('Exit',
                        style: TextStyle(                          
                          fontSize: 22,
                        ),
                        ),
                        onPressed: (){
                         _timer!.cancel();
                           setState(() {
                             outtimer= DateFormat('kk:mm:ss').format(DateTime.now()).toString();
                             outdater= DateFormat('yyyy:MM:dd').format(DateTime.now()).toString();
                           });                                                 
                           widget.visitor.outTime=outtimer;
                            widget.visitor.outDate=outdater;
                            widget.visitor.timeElapsed=_timeasString;                         
                           
                           
                           Navigator.push(
                           context, MaterialPageRoute(builder: (context) =>  VisitorTimingDetails(visitor: widget.visitor,))
                           );
                        }
                   ),
                    ),
                    const SizedBox(height: 45,),
               ]
             ),
          ]
        )
      )
    );
  }
}