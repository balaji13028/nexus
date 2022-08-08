
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application/api_url.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:flutter_application/watchman_module/wm_visitor_out.dart';
import 'package:intl/intl.dart';



// ignore: must_be_immutable
class ViewVisitorProfileWM extends StatefulWidget {
  VisitorData visitor;

ViewVisitorProfileWM({ Key? key, required this.visitor,}) : super(key: key);

  @override
  State<ViewVisitorProfileWM> createState() => _ViewVisitorProfileWMState();
}

class _ViewVisitorProfileWMState extends State<ViewVisitorProfileWM> {
  
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
        elevation: 0,
        backgroundColor:const Color.fromRGBO(39, 105, 170, 1), 
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,),
        color: Colors.white,
        child: ListView(
          children:[
             Column(                       
            children:[ 
             const Padding(padding: EdgeInsets.only(top: 15)),           
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
                   letterSpacing: 1.0,
                   color: Colors.blue.shade900,
                   fontWeight: FontWeight.bold,                 
                  ),
                ),             
               const SizedBox(height: 10,),                         
               Stack(
                 children: [
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
                       height: 520,
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
                                             color: Colors.white
                                           ),
                                           ),
                                           Text(widget.visitor.visitorNumber!,
                                           style:const TextStyle(
                                           fontSize: 20,
                                           color: Colors.white,                          
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
                                           const Text('Purpose of visit :',
                                           style: TextStyle(
                                           fontSize: 12,
                                          color: Colors.white
                                      ),),
                                         Text(widget.visitor.typeOfVisitor!,
                                         style:  const TextStyle(
                                         fontSize: 20,
                                         color: Colors.white,
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
                                          color: Colors.white
                                         ),),
                                         Text(widget.visitor.expectedDuration!,
                                         style:  const TextStyle(
                                         fontSize: 20,
                                         color: Colors.white,
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
                                     const Icon(Icons.home,
                                       color: Colors.white70,
                                       ),
                                       const SizedBox(width: 30,),
                                        Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                          children:  [
                                           const Text('Flat no :',
                                           style: TextStyle(
                                           fontSize: 12,
                                          color: Colors.white
                                      ),),
                                         Text(widget.visitor.apartmentName!,
                                         style:  const TextStyle(
                                         fontSize: 20,
                                         color: Colors.white,
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
                                     const Icon(Icons.apartment,
                                       color: Colors.white70,
                                       ),
                                       const SizedBox(width: 30,),
                                        Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                          children:  [
                                           const Text('Block Name :',
                                           style: TextStyle(
                                           fontSize: 12,
                                          color: Colors.white
                                      ),),
                                         Text(widget.visitor.blockname!,
                                         style:  const TextStyle(
                                         fontSize: 20,
                                         color: Colors.white,
                                        ),
                                        ),
                                       ],
                                      ), 
                                    ],
                                  ),
                                ), 
                                 const SizedBox(height: 6,),
                                Container(
                                  
                                  width: 285,
                                  child: const Divider(
                                    color: Colors.black,
                                    thickness: 2,
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    children: [
                                     const Icon(Icons.access_time_outlined,
                                       color: Colors.white54,
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
                                           style:TextStyle(
                                           fontSize: 18,
                                           color: Colors.green.shade400,                          
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
                                       color: Colors.white54,
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
                                         fontSize: 18,
                                         color: Colors.white70,
                                        ),
                                        ),
                                         Text(widget.visitor.outTime!,                                    
                                         style: const TextStyle(
                                         fontSize: 20,
                                         color: Colors.red,
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
                                     const Icon(Icons.av_timer_rounded,
                                       color: Colors.white54,
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
                                         color: Colors.orange,
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
                
                  
                   //const  SizedBox(height: 30,),
                    Positioned(
                      bottom: 2,
                      left: 100,
                      child: Container(                      
                        color: const Color.fromRGBO(39, 105, 170, 0), 
                        height: 38,
                        width: 140,
                        child: TextButton(                                        
                          child:const Text('Exit',
                          style: TextStyle(                          
                            fontSize: 24,
                            letterSpacing: 0.9,
                            color: Colors.white
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
                              visitorExited(widget.visitor.id!,outtimer,outdater,_timeasString);                                                                                                               
                             Navigator.push(
                             context, MaterialPageRoute(builder: (context) =>  WMVisitorOuttime(visitor: widget.visitor,))
                             );
                          }
                                       ),
                      ),
                    ),
                     ]
               ), 
                    const SizedBox(height: 25,),
               ]
             ),
          ]
        )
      )
    );
  }
}