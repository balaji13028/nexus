import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_application/models/user_details_model.dart';
import 'package:flutter_application/widgets/radio_buttons.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/home_screen.dart';

enum ImageSourceType { gallery, camera }
class EditProfile extends StatefulWidget {
  UserProfileData details;

 EditProfile({ Key? key, required this.details}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Color.fromRGBO(39, 105, 170, 1), 
        centerTitle: true,
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
                        Container(                                                                              
                          child: CircleAvatar(
                            radius: 68,
                          child: ClipOval(                                                     
                          child:(_image != null)
                          ? Image.file(_image,fit: BoxFit.cover,height: size.height*0.215,width: size.width*0.378,)
                          : Image.file(File(widget.details.image!),fit:BoxFit.cover, height: size.height*0.215,width: size.width*0.4                                                                         
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
                              builder:((Builder) => bottomSheet()),
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
           Container(          
             child: Form(
               key: _formKey,
                child: Column(
                 children: [
                  TextFormField(
                    initialValue: widget.details.role,
                          decoration: InputDecoration(                         
                            labelText: 'Who you are?',
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
                            }if(value.trim().length<4){
                              return 'Full name must be at least 4 charcters';
                            }
                            return null;
                          },                          
                          onChanged: (value) => _fullName=value,
                        ),
                          const SizedBox(height: 12,),
                  TextFormField(
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
                            }if(value.trim().length<4){
                              return 'Full name must be at least 4 charcters';
                            }
                            return null;
                          },                          
                          onChanged: (value) => _fullName=value,
                        ),
                          const SizedBox(height: 12,),
                          TextFormField(
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
                          
                          ),
                          const SizedBox(height: 12,),
                          TextFormField(
                            initialValue: '${widget.details.number}',
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
                            if (!RegExp(r'\S+@\S+\. com+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                             return null;
                          },
                          onChanged: (value) => _userEmail = value,
                          ),
                          const SizedBox(height: 12,),
                           
                          TextFormField(
                            initialValue: '${widget.details.flatNo}',
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
                            initialValue:widget.details.ventureName,
                          decoration: InputDecoration(
                            labelText: 'Venture Name',
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
                        RadioButtons(),                                                 
                      ],
                     ), 
                  ),
               ),       
            const SizedBox(height: 25,),
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
