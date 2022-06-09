
import 'package:flutter/material.dart';
import 'package:flutter_application/models/apartment_model.dart';

import '../apartments/apartment_details.dart';



// ignore: must_be_immutable
class ListOfApartments extends StatelessWidget {

  List<ApartmentData> details;

 ListOfApartments({ Key? key,required this.details,}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
      // ignore: avoid_print
      print('list of flats  ${details.length}');     
    return Card(      
     margin:const EdgeInsets.symmetric(horizontal: 14.0,vertical: 6,),
      elevation:8.0,
      shadowColor: Colors.white,    
     shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
      child:Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(39, 105, 170, 1), 

          borderRadius: BorderRadius.circular(10)
        ),
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
           padding:  const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
           
               itemCount:details.length,
               
               itemBuilder: (BuildContext context,int index){ 
                                                        
               return Padding(padding: const EdgeInsets.symmetric(horizontal: 2,),
                   child:
                      GestureDetector(
                        onTap: () {                                     
                           Navigator.push(
                             context, MaterialPageRoute(builder: (context) => ApartmentDetails(apartment: details[index],)));                                                                
                            },                 
                        child: Card(
                            margin:const EdgeInsets.symmetric(horizontal: 5.0,vertical: 6,),
                            elevation:2.0,
                            shadowColor: Colors.white,    
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
                             child: Container(
                                decoration: BoxDecoration(
                                color: Colors.white,                        
                                borderRadius: BorderRadius.circular(10)
                               ),
                              height: 80,
                              width: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [                            
                                                                                                                                           
                                       
                                       Text('${details[index].flatno}',
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold
                                      ),) ,
                                                                                                                                              
                                const SizedBox(height: 2,),
                                  Text('${details[index].relationship}',
                                  style:TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo.shade400,
                                ),
                              ),
                                                  ],
                                                ),
                            ),
                          ),
                        ), 
                );  
            }
        ),
      ),
    );
  }
}