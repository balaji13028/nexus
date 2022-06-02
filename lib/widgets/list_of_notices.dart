
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/notice_model.dart';


class ListOfNotices extends StatelessWidget {
 final List<NoticeData> details;

   ListOfNotices({Key? key,required this.details}) : super(key: key);

  


 
    

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
     print('list of notices  ${details.length}');     
    return 
      Container(      
        padding: const EdgeInsets.symmetric(horizontal: 12),  
        height: size.height*0.3, 
        child:              
                    CarouselSlider.builder(                              
                      
                      itemCount:details.length,                                         
                        itemBuilder: (BuildContext context, int index, realIndex){                                                         
                       return                                                                     
                           
                            Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                                  decoration: BoxDecoration(
                                  color: const Color.fromRGBO(39, 105, 170, 1),                        
                                  borderRadius: BorderRadius.circular(10)
                                ),                            
                                  width: size.width*0.83,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [                                                                                                                                                                                                          
                                         Row(                                                                         
                                            children: [
                                             Text('${details[index].title}',
                                             style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400
                                             ),
                                           ),
                                          ],
                                         ),
                                          SizedBox(height: size.height*0.01,),
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.start,
                                                 children: [
                                                   Flexible(
                                                     child: Text('${details[index].description}',
                                                     overflow: TextOverflow.clip,                                               
                                                       style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.white70,
                                                            fontWeight: FontWeight.w400
                                                         ),
                                                      ),
                                                   )
                                                 ],
                                               ),
                                               SizedBox(height: size.height*0.025,),
                                                   Row(
                                                     children:[
                                                       Column(
                                                         children:[
                                                           Row(
                                                             children: const [
                                                               Text('Start Date :',
                                                               style: TextStyle(
                                                                 fontSize: 13,
                                                                 color: Colors.white
                                                               ),),
                                                             ],
                                                           ),
                                                           Row(
                                                             children: [
                                                               Text('${details[index].startDate}',
                                                           style: const TextStyle(
                                                             fontSize: 16,
                                                             color:Colors.green,
                                                             fontWeight: FontWeight.bold
                                                           ),)
                                                             ],
                                                           )
                                                         ],
                                                       ),
                                                       SizedBox(width: size.width*0.1,),
                                                       Column(     
                                                         mainAxisAlignment: MainAxisAlignment.start,                                                                                                    
                                                         children: [
                                                          Row(   
                                                            mainAxisAlignment: MainAxisAlignment.start,                                                   
                                                             children: const [
                                                               Text('End date :',
                                                               style: TextStyle(
                                                                 fontSize: 13,
                                                                 color:Colors.white
                                                               ),),
                                                             ],
                                                           ),
                                                           Row(
                                                             children: [
                                                               Text('${details[index].endDate}',
                                                           style: const TextStyle(
                                                             fontSize: 16,
                                                             color:Colors.redAccent,
                                                             fontWeight: FontWeight.bold
                                                           ),)
                                                             ],
                                                           )
                                                         ],
                                                       )
                                                     ],
                                                   ),
                                                   SizedBox(height: size.height*0.02,),
                                                   Row(
                                                     mainAxisAlignment: MainAxisAlignment.end,
                                                     children: [
                                                       Text('Created by: ${details[index].createdby}',
                                                       style: const TextStyle(
                                                             fontSize: 14,
                                                             color:Colors.white,
                                                             fontWeight: FontWeight.w500
                                                           ),
                                                           ),
                                                     ]
                                                  ),
                                             ]
                                     ), 
                                 
                           );
                         },
                         options: CarouselOptions(
                           enableInfiniteScroll: true,
                           autoPlay: true,
                           autoPlayCurve: Curves.easeInOut,
                          
                         ),
                   )        
              
         
      );
   }
}                           
                                             
                                             
                                           
                                              
                                   
                     
                   
                               
                         
                 
          
     
