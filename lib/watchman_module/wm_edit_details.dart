import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application/api_url.dart';

import 'package:flutter_application/models/user_details_model.dart';
import 'package:flutter_application/watchman_module/homepage_wm.dart';
import 'package:image_picker/image_picker.dart';

enum ImageSourceType { gallery, camera }

class EditWatchmanProfile extends StatefulWidget {
  UserProfileData details;

 EditWatchmanProfile({ Key? key, required this.details}) : super(key: key);

  @override
  State<EditWatchmanProfile> createState() => _EditWatchmanProfileState();
}

class _EditWatchmanProfileState extends State<EditWatchmanProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController gendercontr=TextEditingController();

  String firstName = '';
  String lastName = '';   
  String _selectedGender = '';

  var _image;

  // ignore: prefer_typing_uninitialized_variables
  var imagePicker;
  // ignore: prefer_typing_uninitialized_variables
  var type;
  
  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  void  takephoto(source) async {
    XFile image = await imagePicker.pickImage(
      source:ImageSource.camera, imageQuality: 100, preferredCameraDevice: CameraDevice.rear);
      setState(() {
        _image = File(image.path);
      });                                 
  }   

  void  galleryphoto(source) async {                                              
    XFile image = await imagePicker.pickImage(
      source:ImageSource.gallery, imageQuality: 100, preferredCameraDevice: CameraDevice.rear);
      setState(() {
        _image = File(image.path);
      });                                 
  }

  @override
  Widget build(BuildContext context) {
    var decodebyte= base64Decode(widget.details.image!);
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile Details'),
        backgroundColor: const Color.fromARGB(255, 36, 79, 122), 
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(
            onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePageWM()));
            },
            icon:const Icon(Icons.home) )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 26,vertical: 10),      
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [               
              Row(   
                mainAxisAlignment: MainAxisAlignment.center,             
                children: [
                  Stack(
                    children: [                 
                      SizedBox(                                                                              
                        child: CircleAvatar(
                          radius: 68,
                          child: ClipOval(                                                     
                            child:(_image != null)
                            ? Image.file(_image,fit: BoxFit.cover,height: size.height*0.215,width: size.width*0.378,)
                            : Image.memory(decodebyte,fit:BoxFit.cover, height: size.height*0.215,width: size.width*0.4  
                            //:Image.asset('assets/images/person logo.jpg',fit: BoxFit.cover,                                                                     
                            ),
                          ),
                        ), 
                      ),
                      Positioned(
                        bottom: 4,
                        right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 36, 79, 122), 
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                            onTap: (){
                              showModalBottomSheet(context: context,
                                builder:((builder) => bottomSheet()),
                              );
                            },
                            child: 
                              const Icon(Icons.camera_alt,
                              color: Colors.white,
                              size: 22,),
                            ),
                          ),
                        )
                      ]
                    )
                  ],
              ),
              const SizedBox(height: 25,),            
              SizedBox(          
                child: Form(
                  key: _formKey,
                  child: Column(
                   children: [                  
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      initialValue: widget.details.firstName,
                      decoration: InputDecoration(                         
                        labelText: 'First Name',
                        labelStyle:  TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w600,                                
                        ),
                        prefixIcon:const Icon(Icons.person),
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
                      if(value.trim().length<3){
                        return 'Full name must be at least 3 charcters';
                      }
                      return null;
                    },                          
                    onChanged: (value) => firstName=value,
                  ),
                  const SizedBox(height: 12,),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      initialValue: widget.details.lastName,
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
                      onChanged: (value) => lastName=value,
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                        initialValue: '${widget.details.number}',
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Contact No',
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
                          }
                          if(value.trim().length!=10){
                            return 'Please enter correct number';
                          }
                          if (!RegExp(r'^(?=.*?[0-9]).{10,}$').hasMatch(value)) {
                            return 'Please enter correct number';
                          }
                          return null;
                        },                            
                      ),
                      SizedBox(
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
                          ]
                        )
                      ),
                    ],
                  ), 
                ),
              ),       
              const SizedBox(height: 10,),              
              SizedBox(                                                
                child: TextButton(
                  child: Ink(decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.indigoAccent                                                 
                  ),
                  child: Container(
                    alignment: Alignment.center,                           
                    constraints:const BoxConstraints(
                      maxWidth: 180,
                      minHeight: 40
                  ),
                  child: const Text('Save',
                    style: TextStyle(color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 0.9,
                      fontWeight: FontWeight.bold,
                    ),
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
                    editUserProfile(widget.details.id!,lastName,'Null',_selectedGender,_image);                     
                  }                                                  
                ),
              ),      
            ]
          ),
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







