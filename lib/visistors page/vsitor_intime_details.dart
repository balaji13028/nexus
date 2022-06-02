
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:flutter_application/visistors%20page/visitor_out-time_details.dart';
import 'package:intl/intl.dart';


class ViewVisitorProfile extends StatefulWidget {
  VisitorData visitor;

  
 
ViewVisitorProfile({ Key? key, required this.visitor,}) : super(key: key);

  @override
  State<ViewVisitorProfile> createState() => _ViewVisitorProfileState();
}

class _ViewVisitorProfileState extends State<ViewVisitorProfile> {
  
 var intime;
 String _timeasString = DateTime.now().toString();
 String _timeasString1 = DateTime.now().toString();
 int _timeasInt = 0;
Timer ?_timer;
String outtimer='';
String outdater='';

@override 
void initState() {
  
  intime=DateTime.parse('${widget.visitor.inDate!} ${widget.visitor.inTime!}');

  _timeasString = DateFormat("kk:mm:ss").format(intime);
  _timeasString1= DateFormat("yyyy-MM-dd").format(intime);
   _timer=Timer.periodic(const Duration(seconds: 1),( Timer t){
    _getDuration(intime);    
  }    
  );
  super.initState();
}

void _getDuration(time1){

Duration timeelapsed = DateTime.now().difference(time1);
if(!mounted) return;
    setState(() {
      _timeasString = timeelapsed.toString().split(".")[0];
      
      _timeasInt = timeelapsed.inMinutes;   

    });               
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor Profile'),      
        centerTitle: true,
        backgroundColor: Color.fromRGBO(39, 105, 170, 1), 
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,),
        child: ListView(
          children:[
             Column(                       
            children:[ 
             const Padding(padding: EdgeInsets.only(top: 6)),           
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,                
                  children: [                                  
                    CircleAvatar(                  
                    radius: 70.0,
                    backgroundColor: Colors.deepPurple.shade500, 
                     child:ClipOval(
                       child: Image.file(File(widget.visitor.visitorImage!),
                       fit: BoxFit.cover,width: 136,height: 136,),
                     ),                                             
                    ),
                  ],
                ),
              const SizedBox(height: 10,),                         
                   Text(widget.visitor.visitorName!,
                   style: TextStyle(
                   fontSize: 22,
                   color: Colors.indigo.shade400,
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
                                         fontSize: 16,
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
                                       fontSize: 16,
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
                   const  SizedBox(height: 15,),
                    ElevatedButton(                      
                      child:const Text('Exit',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      ),
                      onPressed: (){
                       _timer!.cancel();
                         setState(() {
                           outtimer= DateFormat('kk:mm:ss').format(DateTime.now()).toString();
                           outdater= DateFormat('yyyy:MM:dd').format(DateTime.now()).toString();
                         });                                                 
                        //  widget.visitor.outTime=outtimer.toString();
                        //  widget.visitor.outDate=outdater.toString();
                        //  widget.visitor.timeElapsed=_timeasString;                         
                        //  insertVisitor(widget.visitor);
                         
                         Navigator.push(
                         context, MaterialPageRoute(builder: (context) =>  VisitorTimingDetails(visitor: widget.visitor,))
                         );
                      }
                   )
               ]
             ),
          ]
        )
      )
    );
  }
}