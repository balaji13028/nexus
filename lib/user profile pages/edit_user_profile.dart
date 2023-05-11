import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application/api_url.dart';

import 'package:flutter_application/models/user_details_model.dart';
import 'package:image_picker/image_picker.dart';

enum ImageSourceType { gallery, camera }
// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  UserProfileData details;

 EditProfile({ Key? key, required this.details}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
 TextEditingController gendercontr=TextEditingController();
  // ignore: unused_field
  String _fullName = '';
// ignore: unused_field, prefer_final_fields
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
  
   String _selectedGender = '';

  // ignore: prefer_typing_uninitialized_variables
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
    // ignore: prefer_typing_uninitialized_variables
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile Details'),
        backgroundColor: const Color.fromRGBO(39, 105, 170, 1), 
        centerTitle: false,
      ),
      body: Padding(
      padding:const EdgeInsets.symmetric(horizontal: 26,),      
      child: GestureDetector(
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
                          child: CircleAvatar(
                            radius: 68,
                          child: ClipOval(                                                     
                          child:(_image != null)
                          ? Image.file(_image,fit: BoxFit.cover,height: size.height*0.215,width: size.width*0.378,)
                          : Image.memory(decodebyte,fit:BoxFit.cover, height: size.height*0.215,width: size.width*0.4 
                          //:Image.asset('assets/images/person.jpg',fit: BoxFit.cover,                                                                        
                        ),
                      ),                      
                   ), 
                  ),
                     Positioned(
                        bottom: 3,
                        right: 1,
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade500,
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
                            size: 24,),
                          ),
                        ),
                      )
                        ]
                      )
                    ],
                  ),
          const SizedBox(height: 50,),
           // ignore: avoid_unnecessary_containers
           Container(          
             child: Form(
               key: _formKey,
                child: Column(
                 children: [                  
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    initialValue: widget.details.firstName,
                    readOnly: true,
                          decoration: InputDecoration(                         
                            labelText: 'User Name',
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
                            }if(value.trim().length<3){
                              return 'Full name must be at least 3 charcters';
                            }
                            return null;
                          },                          
                          onChanged: (value) => _fullName=value,
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
                          validator: (value){
                            if(value== null ||  value.trim().isEmpty){
                              return 'Enter your Name';
                            }if(value.trim().length<3){
                              return 'Full name must be at least 3 charcters';
                            }
                            return null;
                          },                          
                          onChanged: (value) => _lastName=value,
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
                            initialValue: widget.details.emailId,
                          decoration: InputDecoration(
                            labelText: 'Email ID',
                            labelStyle:  TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                              ),
                              prefixIcon: const Icon(Icons.mail_outline),
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
                            //if (!RegExp(r'\S+@\S+\. com+').hasMatch(value)) {
                             // return 'Please enter a valid email address';
                            //}
                            // return null;
                          },
                          onChanged: (value) => _userEmail = value,
                          ),
                          const SizedBox(height: 12,),
                           
                          TextFormField(
                            initialValue: '${widget.details.flatNo}',
                            readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Flat No',
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
                          onChanged: (value) => _flatNo = value,
                          
                          
                          ),
                         const  SizedBox(height: 12,),
                          TextFormField(
                            initialValue: widget.details.blockName,
                            readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Block No',
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
                            textCapitalization: TextCapitalization.words,
                            initialValue:widget.details.floorName,
                          decoration: InputDecoration(
                            labelText: 'Floor Name',
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
                          onChanged: (value) => _ventureName = value,
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
                 ],
              ), 
            ),
         ),       
            const SizedBox(height: 25,),
              // ignore: sized_box_for_whitespace
              Container(          
                height: 60,                    
                child: TextButton(
                                                                                                                                                                                                                            
                 style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6),),),
                  ),
                  child: Ink(decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                           color: Colors.indigoAccent                                                 
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            
                            constraints:const BoxConstraints(
                              maxWidth: 180,
                              minHeight: 50
                            ),
                            
                            child: const Text('Save',
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
                          editUserProfile(widget.details.id!,_lastName,_userEmail,_selectedGender,_image);      
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
