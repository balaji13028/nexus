import 'package:flutter/material.dart';
import 'package:flutter_application/models/apartment_model.dart';


// ignore: must_be_immutable
class OwnerApartments extends StatelessWidget {

  List<ApartmentData> details;

 OwnerApartments({ Key? key,required this.details,}) : super(key: key);

 

  @override
  Widget build(BuildContext context) { 
    Size size=MediaQuery.of(context).size;              
    return Card(           
      elevation:0,
      shadowColor: Colors.white,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),         
      child:Container(       
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 30, 82, 134),
          borderRadius: BorderRadius.circular(6)
        ),
        height: size.height*0.21,
        child: GridView.builder(  
          reverse: false,                  
          padding:  const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,                                         
            ),
            itemCount:details.length,               
            itemBuilder: (BuildContext context,int index){                                                         
              return 
                GestureDetector(
                  onTap: () {                                     
                    showModalBottomSheet(context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      builder:((builder) => bottomSheet(context,details[index] )),                                                                    
                    );                                                  
                  },                 
                  child: Card(                          
                    elevation: 0,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 4),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child: Container(                             
                      decoration:  BoxDecoration(
                        color: Colors.white,                       
                        borderRadius: BorderRadius.circular(8),                                    
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,                
                        children:  [                                                                                                                                                                                                                  
                          Text(details[index].flatno!,
                            style:TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo.shade400,
                            ),
                          ) ,
                        ],
                      ),
                    ),
                  ),
                );  
            }
        ),
      ),
    );
  }

  Widget bottomSheet( BuildContext context,ApartmentData apartment){
  Size size=MediaQuery.of(context).size;
    return Container(      
          height: 500,                  
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                             children: [    
                              const SizedBox(height: 10,),

                               Row(
                                 children: const [
                
                                    Text('Apartment Details',
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
                                    Text('Name           :',
                                       style: TextStyle(
                                         fontSize: 18,
                                         color: Colors.black
                                       ),
                                       ),
                                  ]
                                ),
                                 SizedBox(width: size.width*0.1,),
                                Column(
                                 
                                  children: [
                                       Text(apartment.name!,                        
                                       style: const TextStyle(
                                       fontSize: 22,
                                       color: Colors.black,                          
                                  ),
                                  ),
                                  ],
                                ),
                                  
                                ],
                              ),
                            
                           SizedBox(height: size.height*0.01,),
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
                                    Text('Mobile No   :',
                                       style: TextStyle(
                                         fontSize: 18,
                                         color: Colors.black
                                       ),
                                       ),
                                  ]
                                ),
                                 SizedBox(width: size.width*0.1,),
                                Column(
                                 
                                  children:[
                                       Text(apartment.mobilenumber!,                        
                                       style:const TextStyle(
                                       fontSize: 22,
                                       color: Colors.black,                          
                                  ),
                                  ),
                                  ],
                                ),
                                  
                                ],
                              ),
                            
                           SizedBox(height: size.height*0.01,),
                          Divider(
                           color: Colors.grey.shade400,           
                          
                            ),
                           
                          
                        Row(               
                            children: [                                                                            
                              Column(                             
                                crossAxisAlignment: CrossAxisAlignment.start,                 
                               children: [                                                                                                           
                                  Icon(Icons.house,
                                   size: 20,
                                   color: Colors.indigo.shade300,
                                   ),
                                ]
                                ),
                                 SizedBox(width: size.width*0.08,),
                                Column(
                                 
                                  children: const[
                                    Text('Flat no         :',
                                       style: TextStyle(
                                         fontSize: 18,
                                         color: Colors.black
                                       ),
                                       ),
                                  ]
                                ),
                                 SizedBox(width: size.width*0.1,),
                                Column(
                                 
                                  children: [
                                       Text(apartment.flatno!,                        
                                       style:const TextStyle(
                                       fontSize: 22,
                                       color: Colors.black,                          
                                  ),
                                  ),
                                  ],
                                ),
                                  
                                ],
                              ),
                            
                           SizedBox(height: size.height*0.01,),
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
                                    Text('Floor            :',
                                       style: TextStyle(
                                         fontSize: 18,
                                         color: Colors.black
                                       ),
                                       ),
                                  ]
                                ),
                                 SizedBox(width: size.width*0.1,),
                                Column(
                                 
                                  children: [
                                       Text(apartment.floor!,                        
                                       style: const TextStyle(
                                       fontSize: 22,
                                       color: Colors.black,                          
                                      ),
                                     ),
                                    ],
                                   ),
                                  
                                 ],
                              ),
                                SizedBox(height: size.height*0.01,),
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
                                    Text('Block           :',
                                       style: TextStyle(
                                         fontSize: 18,
                                         color: Colors.black
                                       ),
                                       ),
                                  ]
                                ),
                                 SizedBox(width: size.width*0.1,),
                                Column(
                                 
                                  children:const [
                                       Text('A-block',                        
                                       style: TextStyle(
                                       fontSize: 22,
                                       color: Colors.black,                          
                                      ),
                                     ),
                                    ],
                                   ),
                                  
                                 ],
                              ),
                                SizedBox(height: size.height*0.01,),
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
                                    Text('Venture       :',
                                       style: TextStyle(
                                         fontSize: 18,
                                         color: Colors.black
                                       ),
                                       ),
                                  ]
                                ),
                                 SizedBox(width: size.width*0.1,),
                                Column(
                                 
                                  children: const[
                                       Text('Jubily Hills',                        
                                       style:  TextStyle(
                                       fontSize: 22,
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
        
      
    );

  }
}