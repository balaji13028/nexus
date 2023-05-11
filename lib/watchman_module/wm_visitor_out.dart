
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:intl/intl.dart';

import 'homepage_wm.dart';

class  WMVisitorOuttime extends StatefulWidget {
  final VisitorData visitor;

   WMVisitorOuttime({ Key? key, required this.visitor}) : super(key: key);

  @override
  State<WMVisitorOuttime> createState() => _WMVisitorOuttimeState();
}

class _WMVisitorOuttimeState extends State<WMVisitorOuttime> {
  String _timeasString = DateTime.now().toString();
  var intime;
  Timer ?_timer;
  
  void initState() {
   
  var stringdateandtime= ('${widget.visitor.inDate!} ${widget.visitor.inTime!}');
  /* now convert date and time string to datetime format */
  intime=DateTime.parse(stringdateandtime);
  
  _timeasString = DateFormat("kk:mm:ss").format(intime);
   
      
       _getDuration(intime);
         
    
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
    Size size=MediaQuery.of(context).size;
    var decodeBytes=base64.decode(widget.visitor.visitorImage!);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0, 
        toolbarHeight: size.height*0.41,      
        backgroundColor: const Color.fromARGB(255, 30, 82, 134), 
        flexibleSpace: FlexibleSpaceBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(            
              children: [
                Container(                
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: IconButton(
                    onPressed:(() {
                      Navigator.push(context,MaterialPageRoute(builder:(context) => HomePageWM(),));
                    }), 
                    icon: const Icon(Icons.arrow_back,size: 25,color: Colors.black,),
                  ),
                ),
              ],
            ),
          ),      
          titlePadding:const  EdgeInsets.only(bottom: 240),
          background: Image.memory(decodeBytes,
            width: double.infinity,
            fit: BoxFit.cover,                
          ),
        ),
        bottom: PreferredSize(
          preferredSize:const  Size.fromHeight(22),
          child:  Container(
                  height: 40,                  
                  width: double.infinity,
                  decoration:const  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Visitor details :',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color:  Color.fromARGB(255, 36, 79, 122), 
                          ),
                        )
                      ],
                    ),
                  ),
              ),
        ),
      ),      
      resizeToAvoidBottomInset: false,
      body: 
        SingleChildScrollView(                      
            child: 
            Column(   
              mainAxisAlignment:MainAxisAlignment.start ,                                        
              children:[                                                                                                                             
                Container(
                  margin:const EdgeInsets.symmetric(),
                  decoration: const BoxDecoration(
                    
                    color: Colors.white,                  
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 6, 10),
                  height: 500,
                  width: double.infinity,
                  child: Row(               
                    children: [                                                                            
                      Column(                             
                        crossAxisAlignment: CrossAxisAlignment.start,                 
                        children: [ 
                          Padding(padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(Icons.person,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 30,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    const Text('Name : ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87
                                      ),
                                    ),
                                    Text(widget.visitor.visitorName!,
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
                          Padding(padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(Icons.phone,
                                  color: Colors.black54,
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
                                    Text(widget.visitor.visitorNumber!,
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
                          Padding(padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(Icons.person,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 30,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    const Text('Purpose of visited : ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87
                                      ),
                                    ),
                                    Text(widget.visitor.typeOfVisitor!,
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
                          Padding(padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(Icons.timer,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 30,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    const Text('Expected Duration : ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87
                                      ),
                                    ),
                                    Text(widget.visitor.expectedDuration!,
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
                          Padding(padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(Icons.home,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 30,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    const Text('Flat No : ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87
                                      ),
                                    ),
                                    Text(widget.visitor.apartmentName!,
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
                          Padding(padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(Icons.apartment,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 30,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    const Text('Block Name : ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87
                                      ),
                                    ),
                                    Text(widget.visitor.blockname!,
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
                          Padding(padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(Icons.timer,
                                  color: Colors.black54,
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
                                    Text(widget.visitor.inDate!,
                                      style:const TextStyle(
                                        fontSize: 16,
                                        color: Colors.indigo,                          
                                      ),
                                    ),
                                    Text(widget.visitor.inTime!,
                                      style:const TextStyle(
                                        fontSize: 18,
                                        color: Colors.green,                          
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Padding(padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(Icons.time_to_leave_sharp,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 30,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    const Text('Out Time:',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87
                                      ),
                                    ),
                                    Text(widget.visitor.outDate!,
                                      style:  const TextStyle(
                                        fontSize: 16,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    Text(widget.visitor.outTime!,                                    
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ), 
                              ],
                            ),
                          ), 
                          const SizedBox(height: 4,),
                          Padding(padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(Icons.timer_off,
                                  color: Colors.black54,
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
                                    Text((widget.visitor.timeElapsed! == 'null')? _timeasString: widget.visitor.timeElapsed!,
                                      style:const TextStyle(
                                        fontSize: 18,
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
                
              const SizedBox(height: 10,)                               
            ]
          ),
        ),
      
    );
  }
}