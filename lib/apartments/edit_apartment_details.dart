import 'package:flutter/material.dart';
import 'package:flutter_application/apartments/apartment_details.dart';
import 'package:flutter_application/models/apartment_model.dart';
import '../admin_module/admin_homepage.dart';


// ignore: must_be_immutable
class EditApartmentDetails extends StatelessWidget {

ApartmentData editapartment;

  EditApartmentDetails({Key? key,required this.editapartment}) : super(key: key);

 final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _name='';
   // ignore: unused_field
   String _number='';
 // ignore: unused_field
 final String _residing='';
 // ignore: unused_field
 String _role='';
 // ignore: unused_field
 String _floorno='';


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
                
                   ]
                   ),
                   
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      Text('${editapartment.flatno}',
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
               SizedBox(height: size.height*0.05,),
                  Container(
                      height: size.height*0.562,
                      padding:  const EdgeInsets.only(right:16,left: 16,top: 30), 
                      decoration: const BoxDecoration( 
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(34),
                          topLeft: Radius.circular(34),
                         
                          ),
                        ),                       
                     child: SingleChildScrollView(
                       scrollDirection: Axis.vertical,
                       child: Form(
                         key: _formKey,
                         child: Column(
                                 children: [    
                                   Row(
                                     children: const [
                                        Text('Profile',
                                        style: TextStyle(
                                          fontSize: 20,
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
                                    SizedBox(height: size.height*0.012,),                                              
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
                                 SizedBox(width: size.width*0.04,),
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
                                 SizedBox(width: size.width*0.13,),
                                  Column(
                                     
                                    children: [
                                      // ignore: sized_box_for_whitespace
                                      Container(                                      
                                        height: size.height*0.068,
                                        width: size.width*0.52,
                                       child: TextFormField(
                                         textCapitalization: TextCapitalization.words,
                                         initialValue:editapartment.name,
                                       decoration: InputDecoration(                                                                
                                       enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10),
                                       borderSide: BorderSide(
                                       color: Colors.grey.shade500,
                                       ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10),
                                       borderSide:BorderSide(
                                       color: Colors.grey.shade600,
                                       ),
                                    ),
                                   floatingLabelBehavior : FloatingLabelBehavior.auto,
                                 ),
                                   validator: (value){
                                      if(value== null ||  value.trim().isEmpty){
                                        return '*This fiels is required';
                                      }if(value.trim().length<4){
                                        return 'Name must be at least 4 charcters';
                                      }
                                      return null;
                                    },
                                   onChanged: (value) => _name=value,
                                   ),
                                 ),
                                           
                                ],
                               ),
                                      
                             ],
                            ),                                                          
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
                                     SizedBox(width: size.width*0.04,),
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
                                     SizedBox(width: size.width*0.072,),
                                    Column(
                                     
                                      children:[
                                           // ignore: sized_box_for_whitespace
                                           Container(
                                           height: size.height*0.068,
                                           width: size.width*0.52,
                                       child: TextFormField(
                                         keyboardType: TextInputType.phone,
                                         initialValue: editapartment.mobilenumber,
                                    decoration: InputDecoration(                                                                
                                    enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10),
                                       borderSide: BorderSide(
                                       color: Colors.grey.shade500,
                                       ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10),
                                       borderSide:BorderSide(
                                       color: Colors.grey.shade600,
                                       ),
                                    ),
                                   floatingLabelBehavior : FloatingLabelBehavior.auto,
                                 ),
                                   validator: (value){
                                      if(value== null ||  value.trim().isEmpty){
                                        return 'Please enter your mobile number';
                                      }if(value.trim().length!=10){
                                      return 'Please enter correct number';
                                    }
                                     if (!RegExp(r'^(?=.*?[0-9]).{10,}$').hasMatch(value)) {
                                      return 'Please enter vaild number';
                                    }
                                      return null;
                                    },
                                   onChanged: (value) => _number=value,
                                 ),
                                         ),
                                      ],
                                    ),
                                      
                                    ],
                                  ),
                                                             
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
                                     SizedBox(width: size.width*0.04,),
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
                                     SizedBox(width: size.width*0.028,),
                                    Column(
                                     
                                      children: [
                                           // ignore: sized_box_for_whitespace
                                           Container(
                                            height: size.height*0.068,
                                           width: size.width*0.52,
                                       child: TextFormField(
                                         initialValue: editapartment.role,
                                    decoration: InputDecoration(                                                                
                                    enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10),
                                       borderSide: BorderSide(
                                       color: Colors.grey.shade500,
                                       ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10),
                                       borderSide:BorderSide(
                                       color: Colors.grey.shade600,
                                       ),
                                    ),
                                   floatingLabelBehavior : FloatingLabelBehavior.auto,
                                 ),
                                   validator: (value){
                                      if(value== null ||  value.trim().isEmpty){
                                        return '*This field is required';
                                      }
                                      return null;
                                    },
                                   onChanged: (value) => _role=value,
                                 ),
                                         ),
                                      ],
                                    ),
                                      
                                    ],
                                  ),
                                                           
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
                                     SizedBox(width: size.width*0.04,),
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
                                     SizedBox(width: size.width*0.048,),
                                    Column(
                                     
                                      children: [
                                          // ignore: sized_box_for_whitespace
                                          Container(
                                           height: size.height*0.068,
                                           width: size.width*0.52,
                                          
                                       child: TextFormField(
                                         initialValue: editapartment.floor,
                                    decoration: InputDecoration(                                                                
                                    enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10),
                                       borderSide: BorderSide(
                                       color: Colors.grey.shade500,
                                       ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10),
                                       borderSide:BorderSide(
                                       color: Colors.grey.shade600,
                                       ),
                                    ),
                                   floatingLabelBehavior : FloatingLabelBehavior.auto,
                                 ),
                                   validator: (value){
                                      if(value== null ||  value.trim().isEmpty){
                                        return '*This field is required';
                                      }
                                      return null;
                                    },
                                   onChanged: (value) => _floorno=value,
                                 ),
                                         ),
                                      ],
                                    ),
                                    ],
                                  ),
                                  SizedBox(height: size.width*0.1,), 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: size.height*0.06,
                                        width: size.width*0.38,                                      
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(6),
                                          color:const Color.fromRGBO(39, 105, 170, 1), 
                                       ),
                                        child: TextButton(  
                                           child:const Text('Submit',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                          ),
                                          onPressed: (() {
                                             if(
                                     _formKey.currentState!.validate()){
                                     _formKey.currentState!.save();
                                        // editapartment.name=_name;                                    
                                        // editapartment.mobilenumber=_number;
                                        // editapartment.relationship=_role;
                                        // editapartment.floor=_floorno;
                                        // insertFlat(editapartment);                     
                                       Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => ApartmentDetails(apartment: editapartment,)));    
                                          }                                          
                                         }
                                        )                                          
                                        ),
                                      ),
                                    ],
                                  ) ,
                                  SizedBox(height: size.height*0.06,)
                                ],
                              ),
                       ),
                     ),
                 ),
               ]
            ), 
        ),
     );
   }
}