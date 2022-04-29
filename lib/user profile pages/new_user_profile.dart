import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/radio_buttons.dart';
import 'package:image_picker/image_picker.dart';
import '../models/user_details_model.dart';

import '../screens/home_screen.dart';


enum ImageSourceType { gallery, camera }
class NewUser extends StatefulWidget {
  final type;
  

 NewUser({ Key? key, this.type,  }) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final _formKey = GlobalKey<FormState>();

  String _fullName = '';

  String _lastName = '';

  String _number = '';  

  String _userEmail = '';

  String _ventureName = '';

  String _blockName = '';

  String _flatNo = '';

  var _image;
  var imagePicker;
  var type;
  
  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }
  

 
    void  takephoto(source) async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image.path);
                });                 
                
              }   

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
          title: const Text('Create a Profile',
          style: TextStyle(
          color: Colors.white70,
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,          
          ),
         ),
         centerTitle: true,      
         backgroundColor: Colors.deepPurple,
          ),
       body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 26,),      
        child:  GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            const SizedBox(height: 30,),
             Row(   
               mainAxisAlignment: MainAxisAlignment.center,             
                  children: [
                     Stack(
                      children: [
                        Container(     
                         child:
                          CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 68,
                          child: ClipOval(                                                     
                            child:(_image != null)
                           ? Image.file(_image,fit: BoxFit.cover,height: size.height*0.215,)
                           : Image.asset('assets/images/2.png',                                                                         
                          ),
                         ),
                       ),
                     ),  
                    ),
                     Positioned(
                        bottom: 4,
                        right: 3,
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            borderRadius: BorderRadius.circular(50),
                          ),
                           child: InkWell(
                            onTap: (){
                             showModalBottomSheet(context: context,
                              builder:((Builder) => bottomSheet()),
                             );
                            },
                            child: 
                           const Icon(Icons.camera_alt,
                            color: Colors.white70,
                            size: 32,),
                            
                           ),
                          ),
                         )
                        ]
                      )
                    ],
                  ),                  
            const SizedBox(height:30 ,),
             Container(          
              child: Form(
                key: _formKey,
                 child: Column(
                   children: [
                     TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Who Are You?',
                            labelStyle:  TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                              ),
                              prefixIcon:const Icon(Icons.person_pin),
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
                            
                          onChanged: (value) => _fullName=value,
                        ),
                          const SizedBox(height: 12,),
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle:  TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                              ),
                              prefixIcon:const  Icon(Icons.person),
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
                              return 'Enter your Name';
                            }if(value.trim().length<4){
                              return 'Full name must be at least 4 charcters';
                            }
                            return null;
                          },
                          onChanged: (value) => _fullName=value,
                        ),
                          const SizedBox(height: 12,),
                          TextFormField(
                           decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle:  TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                              ),
                              prefixIcon: const Icon(Icons.person),
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
                          
                          ),
                          const SizedBox(height: 12,),
                          TextFormField(
                            decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            labelStyle:  TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                              ),
                              prefixIcon: const Icon(Icons.phone_outlined),
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
                              return 'Enter your mobile number';
                            }if(value.trim().length!=10){
                              return 'Please enter correct number';
                            }
                             if (!RegExp(r'^(?=.*?[0-9]).{10,}$').hasMatch(value)) {
                              return 'Please enter correct number';
                            }
                            return null;
                          },
                          onChanged: (value) => _number=value,
                          ),
                          const SizedBox(height: 12,),
                          TextFormField(
                           decoration: InputDecoration(
                             labelText: 'Email ID',
                             labelStyle:  TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                              ),
                             prefixIcon:const Icon(Icons.mail_outline),
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
                            if(value== null || value.trim().isEmpty){
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'\S+@\S+\.com+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                             return null;
                          },
                          onChanged: (value) => _userEmail = value,
                          ),
                          const SizedBox(height: 12,),                           
                          TextFormField(
                            decoration: InputDecoration(
                            labelText: 'Venture Name',
                            labelStyle:  TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                              ),
                             prefixIcon: const Icon(Icons.house_rounded),
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
                            if(value== null || value.trim().isEmpty){
                              return 'Please enter venture name';
                            }
                            
                             return null;
                          },
                          onChanged: (value) => _ventureName = value,
                          
                          
                          ),
                          const SizedBox(height: 12,),
                          TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Block Name',
                            labelStyle:  TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                              ),
                             prefixIcon:const Icon(Icons.house_rounded),
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
                            if(value== null || value.trim().isEmpty){
                              return 'This field is required';
                            }
                            
                             return null;
                          },
                          onChanged: (value) => _blockName = value,
                          ),
                          const SizedBox(height: 12,),
                          TextFormField(                            
                            decoration: InputDecoration(
                            labelText: 'Flat No:',
                            labelStyle:  TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                              ),  
                             prefixIcon: const Icon(Icons.house_rounded),                        
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
                            if(value== null || value.trim().isEmpty){
                              return 'This field is required';
                            }
                            
                             return null;
                          },
                          onChanged: (value) => _flatNo = value,
                          ),
                          const SizedBox(height: 12,),
                         const RadioButtons(),                                                 
                        ],
                     ), 
                    ),
                  ),       
              const SizedBox(height: 25,),
                Container(          
                  height: 60,                    
                  child: TextButton(                                                                                                                                                                                                                                                
                     child: Ink(decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                           color: Colors.indigoAccent                                                 
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            
                            constraints:const BoxConstraints(
                              maxWidth: 150,
                              minHeight: 50
                            ),
                            
                            child: const Text('Submit',
                            style: TextStyle(color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8),
                            textAlign:TextAlign.center,
                            ),
                          ),  
                          ),
                          onPressed: (){                         
                              if(
                          _formKey.currentState!.validate()){
                          _formKey.currentState!.save();
                          Navigator.pop(context);
                        }                        
                       }                                                  
                     ),
                  ),      
               ]
          ),
      ),
      ),
     );
  }

  Widget bottomSheet(){
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          const Text('Choose Profile Photo',
          style: TextStyle(
            fontSize: 20,
          ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                 onPressed: (){
                    takephoto(ImageSourceType.camera);
                 }, 
                child: Column(
                  children:const [
                     Icon(Icons.camera),
                     Text('Camera'),
                  ],
                )
               
                
              ),
            const  SizedBox(width: 20,),
              TextButton(
                 onPressed: (){
                takephoto(ImageSourceType.gallery);
                 }, 
                child: Column(
                  children: const[
                     Icon(Icons.image,),
                     //color: Colors.black,
                     Text('Gallery'),
                  ],
                )
               
                
              ),
            const  SizedBox(width: 20,),
             
            ],
          )
          
        ],
      ),
    );

  }

  
      
    
    
  
}