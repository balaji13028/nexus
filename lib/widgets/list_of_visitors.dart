
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:flutter_application/visistors%20page/visitor_out_time_details.dart';
import 'package:flutter_application/visistors%20page/vsitor_intime_details.dart';



class ListOfVisitors extends StatelessWidget {

  final List<VisitorData> details;

 const ListOfVisitors({ Key? key,required this.details,}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
  
      print('list of visitors ${details.length}');     
    return Card(      
     margin:const EdgeInsets.symmetric(horizontal: 14.0,vertical: 6,),
      elevation:8.0,
      shadowColor: Colors.white,    
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(39, 105, 170, 1),

          borderRadius: BorderRadius.circular(10)
        ),
        
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
           padding:  const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
           
               itemCount:details.length,
               
               itemBuilder: (BuildContext context,int index) { 

            var decodeBytes = base64Decode(details[index].visitorImage!); 

               return Padding(padding: const EdgeInsets.symmetric(horizontal: 5,),
                   child:
                        Column(                          
                          children: [                            
                              Stack(
                                children:[                                                                                                          
                                  GestureDetector(
                                   onTap: () {
                                                           
                                     if(details[index].timeElapsed == 'null'){
                                    Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => ViewVisitorProfile(visitor: details[index])));
                                     }else{
                                   Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => VisitorTimingDetails(visitor: details[index])));
                                     }                                                                     
                               }, 
                                
                                child: CircleAvatar(
                                
                                 radius: 34,
                                 backgroundColor: Colors.white,
                                 child:ClipOval(
                                child:                                 
                                  Image.memory(decodeBytes,fit: BoxFit.cover,width: 66,height: 66,),                                                                        
                               ),                                                                  
                               ), 
                              ),
                             
                                Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                height: 23,
                                width: 23,
                                decoration: BoxDecoration(
                                color: Colors.white,                              
                                borderRadius: BorderRadius.circular(12),
                                ), 
                                child: Center(
                                  child: Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                      color:( details[index].timeElapsed ==  'null')?  Colors.green:Colors.red,
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                  ),
                                ),                                                                                                                                                      
                              )   
                              ), 
                                 
                            ]                             
                          ), 
                            
                          const SizedBox(height: 2,),
                            Text(details[index].visitorName!,
                            style:const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ), 
                ); 
                 
            }
        ),
      ),
    );
  }
}