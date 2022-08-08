import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/user_details_model.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:flutter_application/watchman_module/homepage_wm.dart';
import 'package:flutter_application/watchman_module/wm_visitor_intime.dart';
import 'package:flutter_application/watchman_module/wm_visitor_out.dart';



class WMListOfVisitors extends StatefulWidget {

  final List<VisitorData> details;
  

 const WMListOfVisitors({ Key? key,required this.details}) : super(key: key);

  @override
  State<WMListOfVisitors> createState() => _WMListOfVisitorsState();
}

class _WMListOfVisitorsState extends State<WMListOfVisitors> {
  @override
  Widget build(BuildContext context) {             
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
            color: Colors.black87,
            size: 28,
          ),
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: ((context) => HomePageWM())));
          },
        ),
        actions: [
          IconButton(
            onPressed:(() {
              
            }),
            icon: const Icon(Icons.search,
              size: 28,
              color: Colors.black87,
            ))
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          child:
            Text('All Visitors',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(
            height: 510,
            child: ListView.builder(  
              shrinkWrap: true,           
              itemCount: widget.details.length,                                                        
              itemBuilder: (BuildContext context,int index) { 
                var decodeBytes = base64Decode(widget.details[index].visitorImage!);              
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {                                                             
                          if(widget.details[index].outTime == '--:--:--'){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ViewVisitorProfileWM(visitor: widget.details[index])));
                          }
                          else{
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WMVisitorOuttime(visitor: widget.details[index])));
                          }                                                                     
                        },                                                               
                        child: Container(
                          width: double.infinity,
                          color: Colors.white38,                        
                          child: Row(
                            children: [
                              Stack(
                                children:[
                                  Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                    shadowColor: Colors.white,
                                    elevation: 2,
                                    child: CircleAvatar(                                  
                                    radius: 28,
                                    backgroundColor: const Color.fromARGB(255, 36, 79, 122), 
                                    child:ClipOval(
                                      child:                                 
                                      Image.memory(decodeBytes,fit: BoxFit.cover,width: 56,height: 56,),                                                                        
                                    ),                                                                  
                                    ),
                                  ),
                                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          color: Colors.white,                              
                          borderRadius: BorderRadius.circular(50),
                        ), 
                        child: Center(
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color:(widget.details[index].outTime == '--:--:--')?  Colors.green:Colors.red,
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),                                                                                                                                                      
                      )   
                    ),
                                ]  
                              ),                           
                              Padding(
                                padding: const EdgeInsets.only(left:12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [                              
                                    Text(widget.details[index].visitorName!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.8,
                                        color:  Color.fromARGB(255, 36, 79, 122), 
                                      ), 
                                    ),
                                    Text('+91 ${widget.details[index].visitorNumber!}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400
                                      ), 
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ), 
                ); 
              },                                           
            ),
          ),
        ],
      ),
    );
  }
}