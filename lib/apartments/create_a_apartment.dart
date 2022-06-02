import 'package:flutter/material.dart';
import 'package:flutter_application/api_url.dart';
import 'package:flutter_application/models/apartment-model.dart';
import 'package:flutter_application/models/visitor_details_model.dart';

import '../screens/home_screen.dart';

class CreateApartment extends StatelessWidget {
  CreateApartment({Key? key}) : super(key: key);


final _formKey = GlobalKey<FormState>();
 TextEditingController namecontroller=TextEditingController();
 TextEditingController numbercontroller=TextEditingController();
 TextEditingController rolecontroller=TextEditingController();
 TextEditingController floorcontroller=TextEditingController();
 TextEditingController flatcontroller=TextEditingController();
 String _role='';
 String _name='';
String _contactNumber='';
String _flore='';
String _flatNo='';



  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Create a Apartment',
        style: TextStyle(
          fontSize: 22,
          letterSpacing: 1.0
        ),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(39, 105, 170, 1),
      ),
       resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),       
        decoration: const BoxDecoration(
          color: Colors.white
        ), 
        child: Column(
          children: [
            Container(
              height: size.height*0.75,
                  padding:  const EdgeInsets.only(right:24,left: 24,top: 40), 
                  decoration: const BoxDecoration( 
                     gradient: LinearGradient(
          colors: [
            Color.fromRGBO(4, 9, 35, 1),
            Color.fromRGBO(39, 105, 171, 1),
            ],
             begin: FractionalOffset.bottomCenter,
             end: FractionalOffset.topCenter
           ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                     
                      ),
                    ),
                   child: SingleChildScrollView(
                     scrollDirection: Axis.vertical,
                     child: Form(
                         key: _formKey,          
                          child: Column(
                           children: [ 
                             TextFormField(
                                style: const TextStyle(color: Colors.white),
                               controller: rolecontroller,
                            decoration: InputDecoration(
                              labelText: 'Who Are You?',
                              labelStyle:  TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500,
                                ),
                                prefixIcon:const Icon(Icons.person_pin,color: Colors.white70,),
                               enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                               borderSide: BorderSide(
                               color: Colors.grey.shade500,
                               ),
                              ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                               borderSide:BorderSide(
                               color: Colors.grey.shade500,
                               ),
                             ),
                               floatingLabelBehavior : FloatingLabelBehavior.auto,
                              ),
                              
                            onChanged: (value) => _role=value,
                          ),
                            const SizedBox(height: 12,),                                                
                            TextFormField(
                               style: const TextStyle(color: Colors.white),
                              controller: namecontroller,
                                decoration: InputDecoration(
                                  labelText: 'Full Name',
                                    labelStyle:  TextStyle(
                                     fontSize: 14,
                                     color: Colors.grey.shade400,
                                       fontWeight: FontWeight.w500
                                    ),
                                    prefixIcon:const Icon(Icons.person,size: 21,color:Colors.white70),
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
                                        return 'Enter your Name';
                                      }if(value.trim().length<4){
                                        return 'Full name must be at least 4 charcters';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) => _name=value,
                                 ),
                            const SizedBox(height: 10,),
                               TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  keyboardType: TextInputType.phone,
                                 controller: numbercontroller,
                                    decoration: InputDecoration(
                                      labelText: 'Contact Number',
                                       labelStyle:  TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.w500
                                        
                                        ),
                                       prefixIcon: const Icon(Icons.call,size: 21,color:Colors.white70),
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
                                        return 'Enter your mobile number';
                                      }if(value.trim().length!=10){
                                        return 'Please enter correct number';
                                      }
                                       if (!RegExp(r'^(?=.*?[0-9]).{10,}$').hasMatch(value)) {
                                        return 'Please enter vaild number';
                                      }
                                      return null;
                                    },          
                                    onChanged: (value) => _contactNumber=value,
                                  ),
                                  SizedBox(height: 12,),
                                  TextFormField(
                                     style: const TextStyle(color: Colors.white),
                                     keyboardType: TextInputType.number,
                                    controller: floorcontroller,
                            decoration: InputDecoration(
                              labelText: ' Which Flore are you?',
                              labelStyle:  TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500,
                                ),
                                prefixIcon:const Icon(Icons.person_pin,color: Colors.white70,),
                               enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                               borderSide: BorderSide(
                               color: Colors.grey.shade500,
                               ),
                              ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                               borderSide:BorderSide(
                               color: Colors.grey.shade500,
                               ),
                             ),
                               floatingLabelBehavior : FloatingLabelBehavior.auto,
                              ),
                              
                            onChanged: (value) => _flore=value,
                          ),
                            const SizedBox(height: 12,),                                                       
                                  TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.number,
                                        controller: flatcontroller,
                                          decoration: InputDecoration(                                          
                                          labelText: 'Flat no',
                                            labelStyle:  TextStyle(
                                             fontSize: 14,
                                             color: Colors.grey.shade500,
                                             fontWeight: FontWeight.w500
                                            
                                            ),
                                            prefixIcon:const Icon(Icons.house_rounded,size: 21,color:Colors.white70),
                                            enabledBorder: OutlineInputBorder(
                                               borderRadius: BorderRadius.circular(10),
                                               borderSide: BorderSide(
                                               color: Colors.grey.shade400,
                                               ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                               borderRadius: BorderRadius.circular(10),
                                               borderSide:BorderSide(
                                               color: Colors.grey.shade400,
                                               ),
                                            ),
                                           floatingLabelBehavior : FloatingLabelBehavior.auto,
                                           ),
                                           validator: (value){
                                              if(value== null ||  value.trim().isEmpty){
                                                return 'Enter flat number';
                                              }
                                              return null;
                                            },
                                           onChanged: (value) => _flatNo=value,
                                      ), 
                                
                            const SizedBox(height: 24,),               
                             Container(                                           
                               child: TextButton(                                                                                                                                                                                                                                              
                                 child:Ink(decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: const Color.fromRGBO(39, 105, 170, 1),                                              
                                    ),
                                     child: Container(
                                      alignment: Alignment.center,                            
                                      constraints:const BoxConstraints(
                                        maxWidth: 140,
                                        minHeight: 40
                                      ), 
                                      child: const Text('Create',
                                      style: TextStyle(color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                      textAlign:TextAlign.center,
                                      ),
                                    ),  
                                  ),
                                  onPressed: (){ 
                                       
                                    if(
                                    _formKey.currentState!.validate()){
                                    _formKey.currentState!.save();
                                    //  newFlat.stayingperson=_role;
                                    //  newFlat.fullName=_name;
                                    //  newFlat.contactnumber=_contactNumber;
                                    //  newFlat.whichflore=_flore;
                                    //  newFlat.flatNo=_flatNo;
                                    //  insertFlat(newFlat);
                                    //  apartment();
                                   
                                    flatApi(namecontroller.text,numbercontroller.text,rolecontroller.text,floorcontroller.text,flatcontroller.text);
                                    flatResponse();
                                  Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => HomeScreen()));                                                                                                                
                                  
                                         }                                                                                                                                                                          
                                       }                                                  
                                      ),
                                    ),      
                                   ]
                                 ),
                     
                       ),
                     
                   ),  
            )
          ],
        ), 
       ),
      
    );
  }
}