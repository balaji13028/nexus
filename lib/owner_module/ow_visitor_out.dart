
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:flutter_application/owner_module/owner_homepage.dart';


class  OwnerVisitorOuttime extends StatelessWidget {
  final VisitorData visitor;

  const OwnerVisitorOuttime({ Key? key, required this.visitor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var decodeBytes=base64.decode(visitor.visitorImage!);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor Profile'),      
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => const HomepageOW(),));
          },
        ),
        elevation: 0,        
        backgroundColor:const Color.fromRGBO(39, 105, 170, 1), 
      ),      
      resizeToAvoidBottomInset: false,
      body: 
        SingleChildScrollView(
          child: Container(  
            padding: const EdgeInsets.only(top: 18),                 
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
              children:[ 
                Padding(padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,                
                    children: [                                          
                      CircleAvatar(                  
                        radius: 65.0,
                        backgroundColor: Colors.white,
                        child:ClipOval (
                          child: Image.memory(decodeBytes,
                          fit: BoxFit.cover,width: 127,height: 127,),
                        ),                                             
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6,),                         
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(visitor.visitorName!,
                      style: const TextStyle(
                        fontSize: 22,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,                 
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12,),                                                                               
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,                  
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 6, 10),
                  height: 270,
                  width: double.infinity,
                  child: Row(               
                    children: [                                                                            
                      Column(                             
                        crossAxisAlignment: CrossAxisAlignment.start,                 
                        children: [                        
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
                                    Text(visitor.typeOfVisitor!,
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
                                    Text(visitor.expectedDuration!,
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
                                    Text(visitor.apartmentName!,
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
                                    Text(visitor.blockname!,
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
                        ],
                      ),  
                    ],
                  ),
                ),
                Card(
                  margin:const EdgeInsets.symmetric(horizontal: 6.0,vertical: 2,),
                  elevation:2.0,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), 
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white24,                         
                      borderRadius: BorderRadius.circular(12),
                    ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 6, 10),
                  height: 190,
                  child: Row(               
                    children: [                                                                            
                      Column(                             
                        crossAxisAlignment: CrossAxisAlignment.start,                 
                        children: [                        
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
                                    Text(visitor.inDate!,
                                      style:const TextStyle(
                                        fontSize: 16,
                                        color: Colors.indigo,                          
                                      ),
                                    ),
                                    Text(visitor.inTime!,
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
                                    Text(visitor.outDate!,
                                      style:  const TextStyle(
                                        fontSize: 16,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    Text(visitor.outTime!,                                    
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
                                    Text(visitor.timeElapsed!,
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
              ),  
              const SizedBox(height: 10,)                               
            ]
          ),
        ),
      )
    );
  }
}