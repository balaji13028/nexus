import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:flutter_application/watchman_module/wm_visitor_intime.dart';
import 'package:flutter_application/watchman_module/wm_visitor_out.dart';



class WMVisitors extends StatelessWidget {

  final List<VisitorData> details;
  

 const WMVisitors({ Key? key,required this.details,}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {   
    print('list of visistors are ${details.length}' );          
    return SizedBox(        
      height: 180,      
      child: GridView.builder(                          
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 6),
        padding:  const EdgeInsets.symmetric(horizontal: 27,vertical: 3),             
        itemCount:8,                 
        itemBuilder: ( context,int index,) {     
          var decodeBytes = base64Decode(details[index].visitorImage!);            
          return
            Column(                          
              children: [                            
                Stack(
                  children:[                                                                                                          
                    GestureDetector(
                      onTap: () {                                                             
                        if(details[index].outTime == '--:--:--'){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewVisitorProfileWM(visitor: details[index])));
                        }
                        else  {

                          Navigator.push(context, MaterialPageRoute(builder: (context) => WMVisitorOuttime(visitor: details[index])));
                        }                                                                     
                      },                                   
                      child: CircleAvatar(                                  
                        radius: 28,
                        backgroundColor: Colors.black87,
                        child:ClipOval(
                          child:(decodeBytes.isNotEmpty)?                                 
                            Image.memory(decodeBytes,fit: BoxFit.cover,width: 54,height: 54,)
                            :Image.asset('assets/images/person logo.jpg',fit: BoxFit.cover,)                                                                      
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
                              color:( details[index].outTime==  '--:--:--')?  Colors.green:Colors.red,
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),                                                                                                                                                      
                      )   
                    ),
                  ]                             
                ),
                const SizedBox(height: 4,),
                Text(details[index].visitorName!,
                  style:const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                  ),
                ),
              ],
            );
          }                                           
        ),
    );
  }
}