import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application/api_url.dart';
import 'package:image_picker/image_picker.dart';
import '../admin_module/admin_homepage.dart';


enum ImageSourceType { gallery, camera }
class NewUser extends StatefulWidget {
  
  const  NewUser({ Key? key,  }) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstnamecontr=TextEditingController();
  TextEditingController lastnamecontr=TextEditingController();
  TextEditingController numbercontr=TextEditingController();
  TextEditingController rolecontr=TextEditingController();
  TextEditingController emailcontr=TextEditingController();
  TextEditingController blockcontr=TextEditingController();
  TextEditingController venturecontr=TextEditingController();
  TextEditingController flatcontr=TextEditingController();
  TextEditingController gendercontr=TextEditingController();
  // ignore: unused_field
  String _fullName = '';
// ignore: unused_field
  String _lastName = '';
// ignore: unused_field
  String _number = '';  
// ignore: unused_field
  String _userEmail = '';
// ignore: unused_field
  String _ventureName = '';
// ignore: unused_field
  String _blockName = '';
// ignore: unused_field
  String _flatNo = '';
  // ignore: unused_field
  String _role='';
  String gender='';
   String _selectedGender = '';

  // ignore: prefer_typing_uninitialized_variables
  var _image;
  // ignore: prefer_typing_uninitialized_variables
  var imagePicker;
  
  
  @override
  void initState() {
    
    super.initState();
    imagePicker = ImagePicker();
  }
   
    void  takephoto(source) async {            
         
              final image = await imagePicker.pickImage(
                    source: ImageSource.camera, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image!.path);
                });                 
                
              }   

    void  galleryphoto(source) async {
              
                final image = await imagePicker.pickImage(
                    source: ImageSource.gallery, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image!.path);
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
         backgroundColor: const Color.fromRGBO(39, 105, 170, 1), 
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
                        // ignore: avoid_unnecessary_containers
                        Container(     
                         child:
                          CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 68,
                          child: ClipOval(                                                     
                            child:(_image != null)
                           ? Image.file(_image,fit: BoxFit.cover,height: size.height*0.215,width: size.width*0.380,)
                           : Image.asset('assets/images/download.png',                                                                         
                          ),
                         ),
                       ),
                     ),  
                    ),
                     Positioned(
                        bottom: 4,                       
                        right: 2,                       
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                           child: InkWell(
                            onTap: (){
                             showModalBottomSheet(context: context,
                              // ignore: avoid_types_as_parameter_names
                              builder:((builder) => bottomSheet()),
                             );
                            },
                            child: 
                           const Icon(Icons.camera_alt,
                            color: Colors.white,
                            size: 26,),
                            
                           ),
                          ),
                         )
                        ]
                      )
                    ],
                  ),                  
            const SizedBox(height:30 ,),
             // ignore: avoid_unnecessary_containers
             Container(          
              child: Form(
                key: _formKey,
                 child: Column(
                   children: [
                     TextFormField(
                        textCapitalization: TextCapitalization.words,
                       keyboardType: TextInputType.text,
                       controller: rolecontr,
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
                            
                          onChanged: (value) => _role=value,
                        ),
                          const SizedBox(height: 12,),
                      TextFormField(
                         textCapitalization: TextCapitalization.words,
                        controller: firstnamecontr,
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
                            }
                            return null;
                          },
                          onChanged: (value) => _fullName=value,
                        ),
                          const SizedBox(height: 12,),
                          TextFormField(
                             textCapitalization: TextCapitalization.words,
                            controller: lastnamecontr,
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
                            ),validator: (value){
                            if(value== null ||  value.trim().isEmpty){
                              return 'Enter your Name';
                            }
                            return null;
                          },
                          onChanged: (value) => _lastName=value,
                          ),
                          const SizedBox(height: 12,),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: numbercontr,
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
                            keyboardType: TextInputType.emailAddress,
                            controller: emailcontr,
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
                            // if (!RegExp(r'\S+@\S+\.com+').hasMatch(value)) {
                            //   return 'Please enter a valid email address';
                            // }
                             return null;
                          },
                          onChanged: (value) => _userEmail = value,
                          ),
                          const SizedBox(height: 12,),                           
                          TextFormField(
                            controller: venturecontr,
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
                            keyboardType: TextInputType.streetAddress,
                            controller: blockcontr,
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
                            keyboardType: TextInputType.number,
                            controller: flatcontr,                         
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
                        Container(
                           child: 
               Column(
          
            children: [
             
              ListTile(
                
                leading: Radio<String>(
                  value: 'Male',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                     gendercontr.text = 'Male';
                                     
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                
                ),
                
                title: const Text('Male'),
              ),
              
              ListTile(
                leading: Radio<String>(
                  value: 'Female',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                     gendercontr.text = 'Female';
                    setState(() {
                      _selectedGender = value!;
                      
                    });
                  },
                ),
                title: const Text('Female'),
              ),
            ])

           
    ),                                              
          ]
                     ), 
                    ),
                  ),       
              const SizedBox(height: 25,),
                // ignore: sized_box_for_whitespace
                Container(          
                  height: 60,                    
                  child: TextButton(                                                                                                                                                                                                                                                
                     child: Ink(decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                           color:  const Color.fromRGBO(39, 105, 170, 1),                                              
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
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.8),
                            textAlign:TextAlign.center,
                            ),
                          ),  
                          ),
                          onPressed: (){                         
                              if(
                          _formKey.currentState!.validate()){
                          _formKey.currentState!.save();
                          // newUser.image=_image.path;
                          // newUser.role=_role;
                        
                          // newUser.firstName=_fullName;
                          // newUser.lastName=_lastName;
                          // newUser.number=_number;
                          // newUser.emailId=_userEmail;
                          // newUser.gender='male';
                          // newUser.flatNo=_flatNo;
                          // newUser.blockName=_blockName;
                          // newUser.ventureName=_ventureName;
                          // insertUser(newUser);
                          // user();
                          userApi(
                           firstnamecontr.text,
                           lastnamecontr.text,
                           rolecontr.text,
                           numbercontr.text,
                           emailcontr.text, 
                           venturecontr.text,
                           blockcontr.text,
                           flatcontr.text,
                           gendercontr.text,
                           _image
                           );
                         
                         Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const AdminHomepage()));
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
      height: 110,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Choose Profile Photo',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500
          ),
          ),
          const SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                 onPressed: (){
                    takephoto(ImageSourceType.camera);
                 }, 
                child: Column(
                  children:const [
                     Icon(Icons.camera,
                     size: 33,
                     color: Colors.indigo,),
                     Text('Camera',
                     style: TextStyle(
                       color: Colors.black
                     ),
                     ),
                  ],
                )
               
                
              ),
            const  SizedBox(width: 20,),
              TextButton(
                 onPressed: (){
                galleryphoto(ImageSourceType.gallery);
                 }, 
                child: Column(
                  children: const[
                     Icon(Icons.image,
                     size: 33,
                     color: Colors.indigo,
                     ),
                     //color: Colors.black,
                     Text('Gallery',
                     style: TextStyle(
                       color: Colors.black
                     ),),
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