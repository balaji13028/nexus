import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ViewVisitorProfile extends StatefulWidget {
  final String name,image,typeOfvisitor,numb,duration;   
 final int timeSpan1;
 
const  ViewVisitorProfile({ Key? key, required this.name, required this.numb,required this.image ,required this.typeOfvisitor, required this.duration, required this.timeSpan1,}) : super(key: key);

  @override
  State<ViewVisitorProfile> createState() => _ViewVisitorProfileState();
}

class _ViewVisitorProfileState extends State<ViewVisitorProfile> {
  
 var intime = DateTime(2022,05,02,15,50,00);
 String outtime = DateFormat('hh:mm:ss').format(DateTime.now());
 String outdate = DateFormat('dd-MM-yyyy').format(DateTime.now());
 String _timeasString = DateTime.now().toString();
 int _timeasInt = 0;
 String indate = DateTime.now().toString();
 String intimeing = DateTime.now().toString();
 

@override 
void initState(){
   indate = DateFormat('dd-MM-yyyy').format(intime);
   intimeing = DateFormat('hh:mm:ss').format(intime);
  _timeasString = DateFormat("hh:mm:ss").format(intime);
  Timer.periodic(const Duration(seconds: 1),( Timer t){
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
        backgroundColor: Colors.deepPurple.shade500,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,),
        child: Column(                       
          children:[ 
           const Padding(padding: EdgeInsets.only(top: 6)),           
              Row(
                mainAxisAlignment: MainAxisAlignment.center,                
                children: [                                  
                  CircleAvatar(                  
                  radius: 70.0,
                  backgroundColor: Colors.deepPurple.shade500, 
                   child:ClipOval(
                     child: Image.file(File(widget.image),
                     fit: BoxFit.cover,width: 136,height: 136,),
                   ),                                             
                  ),
                ],
              ),
            const SizedBox(height: 10,),                         
                 Text(widget.name,
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
                                       Text('${widget.numb}',
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
                                     Text(widget.typeOfvisitor,
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
                                     Text(widget.duration,
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
                                       Text(indate,
                                       style:const TextStyle(
                                       fontSize: 16,
                                       color: Colors.white70,                          
                                  ),
                                  ),
                                   Text(intimeing,
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
                                     Text(outdate,
                                     style:  const TextStyle(
                                     fontSize: 16,
                                     color: Colors.white70,
                                    ),
                                    ),
                                     Text(outtime,                                    
                                     style:  const TextStyle(
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
                                     style: TextStyle(
                                     fontSize: 16,
                                     color: (_timeasInt>95)?Colors.red:Colors.white70,
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
       )
      )
    );
  }


}