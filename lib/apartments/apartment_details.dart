import 'package:flutter/material.dart';
import 'package:flutter_application/models/apartment_model.dart';
import 'package:flutter_application/admin_module/admin_homepage.dart';
import 'edit_apartment_details.dart';

// ignore: must_be_immutable
class ApartmentDetails extends StatelessWidget {

  ApartmentData apartment;

  ApartmentDetails({Key? key,required this.apartment}) : super(key: key);
  


  @override
  Widget build(BuildContext context) {
     Size size=MediaQuery.of(context).size;
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      body: Container(      
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
            padding:  const EdgeInsets.only(right:0,left: 0,top: 22), 
              child:  Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                children: [                                                     
                   Row(                    
                   children: [                     
                      Column(      
                     mainAxisAlignment: MainAxisAlignment.start,                                   
                     children: [                       
                       IconButton(icon:const Icon(Icons.arrow_back_sharp,
                       size: 30,
                       color: Colors.white,
                       ),
                       onPressed: (){
                       Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const AdminHomepage()));
                       }
                       ),
                     ],
                   ), 
                  Padding(
                   padding:  EdgeInsets.only(left: size.width*0.24),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,                 
                      children: const[                                            
                         Text('Flat no',
                         textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.1,
                          color: Colors.white                        
                        ),
                        ), 
                      ],
                    ),
                 ), 
                 Padding(
                   padding: EdgeInsets.only(left: size.width*0.24),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       IconButton(
                         icon:const Icon(Icons.edit_note,
                         color: Colors.white,
                         size: 36,
                         ), 
                         onPressed: () {  
                           Navigator.push(
                               context, MaterialPageRoute(builder: (context) => EditApartmentDetails(editapartment: apartment)));
                         },
                         
                       )
                     ],
                   ),
                 )
                   ]
                   ),
                   
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      Text(apartment.flatno!,
                        style: const TextStyle(
                           fontSize: 22,
                           color: Colors.white,
                           fontWeight: FontWeight.w500,
                        ),
                      
                         
                    ),
                   ],
                 ),
                   SizedBox(height: size.height*0.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children:const [
                      CircleAvatar(
                        radius: 66,
                        backgroundColor:Colors.white70,
                         
                    ),
                   ],
                 ),
               SizedBox(height: size.height*0.095,),
                  Container(
                      height: size.height*0.51,
                      padding:  const EdgeInsets.only(right:24,left: 24,top: 30), 
                      decoration: const BoxDecoration( 
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(34),
                          topLeft: Radius.circular(34),
                         
                          ),
                        ),                       
                     child: Column(
                             children: [    
                               Row(
                                 children: const [
                                    Text('Profile',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w500,
                                    ),)
                                 ],
                               ),   
                                SizedBox(height: size.height*0.003,),
                          Divider(
                           color: Colors.grey.shade500,  
                           thickness: 1,         
                          
                            ), 
                                SizedBox(height: size.height*0.014,),                                              
                          Row(               
                            children: [                                                                            
                              Column(                             
                                crossAxisAlignment: CrossAxisAlignment.start,                 
                               children:[                                                                                                           
                                  Icon(Icons.person,
                                  size: 20,
                                   color: Colors.indigo.shade300,
                                   ),
                                ]
                                ),
                                 SizedBox(width: size.width*0.08,),
                                Column(
                                 
                                  children: const[
                                    Text('Name  ',
                                       style: TextStyle(
                                         fontSize: 16,
                                         color: Colors.black
                                       ),
                                       ),
                                  ]
                                ),
                                 SizedBox(width: size.width*0.23,),
                                Column(
                                 
                                  children: [
                                       Text(apartment.name!,                        
                                       style: const TextStyle(
                                       fontSize: 21,
                                       color: Colors.black,                          
                                  ),
                                  ),
                                  ],
                                ),
                                  
                                ],
                              ),
                            
                           SizedBox(height: size.height*0.013,),
                          Divider(
                           color: Colors.grey.shade400,           
                          
                            ),
                            Row(               
                            children: [                                                                            
                              Column(                             
                                crossAxisAlignment: CrossAxisAlignment.start,                 
                               children: [                                                                                                           
                                  Icon(Icons.call,
                                   size: 20,
                                   color: Colors.indigo.shade300,
                                   ),
                                ]
                                ),
                                 SizedBox(width: size.width*0.08,),
                                Column(
                                 
                                  children: const[
                                    Text('Mobile No',
                                       style: TextStyle(
                                         fontSize: 16,
                                         color: Colors.black
                                       ),
                                       ),
                                  ]
                                ),
                                 SizedBox(width: size.width*0.16,),
                                Column(
                                 
                                  children:[
                                       Text(apartment.mobilenumber!,                        
                                       style:const TextStyle(
                                       fontSize: 21,
                                       color: Colors.black,                          
                                  ),
                                  ),
                                  ],
                                ),
                                  
                                ],
                              ),
                            
                           SizedBox(height: size.height*0.013,),
                          Divider(
                           color: Colors.grey.shade400,           
                          
                            ),
                           
                          
                        Row(               
                            children: [                                                                            
                              Column(                             
                                crossAxisAlignment: CrossAxisAlignment.start,                 
                               children: [                                                                                                           
                                  Icon(Icons.people,
                                   size: 20,
                                   color: Colors.indigo.shade300,
                                   ),
                                ]
                                ),
                                 SizedBox(width: size.width*0.08,),
                                Column(
                                 
                                  children: const[
                                    Text('Relationship ',
                                       style: TextStyle(
                                         fontSize: 16,
                                         color: Colors.black
                                       ),
                                       ),
                                  ]
                                ),
                                 SizedBox(width: size.width*0.105,),
                                Column(
                                 
                                  children: [
                                       Text(apartment.role!,                        
                                       style:const TextStyle(
                                       fontSize: 21,
                                       color: Colors.black,                          
                                  ),
                                  ),
                                  ],
                                ),
                                  
                                ],
                              ),
                            
                           SizedBox(height: size.height*0.014,),
                          Divider(
                           color: Colors.grey.shade400,           
                          
                            ),
                      Row(               
                            children: [                                                                            
                              Column(                             
                                crossAxisAlignment: CrossAxisAlignment.start,                 
                               children: [                                                                                                           
                                  Icon(Icons.home,
                                   size: 20,
                                  color: Colors.indigo.shade300,
                                   ),
                                ]
                                ),
                                 SizedBox(width: size.width*0.08,),
                                Column(
                                 
                                  children: const[
                                    Text('Which Floor',
                                       style: TextStyle(
                                         fontSize: 16,
                                         color: Colors.black
                                       ),
                                       ),
                                  ]
                                ),
                                 SizedBox(width: size.width*0.125,),
                                Column(
                                 
                                  children: [
                                       Text(apartment.floor!,                        
                                       style: const TextStyle(
                                       fontSize: 21,
                                       color: Colors.black,                          
                                      ),
                                     ),
                                    ],
                                   ),
                                  
                                 ],
                              ),
                          ],
                        ),
                      ), 
                  ]
              ),
          ),  
      );
   }
}