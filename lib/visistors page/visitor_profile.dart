import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'view_visitor_details.dart';

class VisitorProfile extends StatefulWidget {
  
  final File img;
 VisitorProfile({ Key? key, required this.img }) : super(key: key);

  @override
  State<VisitorProfile> createState() => _VisitorProfileState();
}

class _VisitorProfileState extends State<VisitorProfile> {
   
  final _formKey = GlobalKey<FormState>();
 final TextEditingController _controller = TextEditingController();
   
  
  bool value1 = false;
  bool value2 = false;
  bool value3 = false; 
  bool value4 = false;
  bool textreadonly = true;  
  String visitorType ='';
  String durationtime='';
  String _fullName = '';
  var timeSpan ;
  String number = '';

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create a vistor profile'),
          backgroundColor: Colors.deepPurple.shade500,
          centerTitle: true,
        ),resizeToAvoidBottomInset: false,    
        body: GestureDetector(
          onTap: (() {
               FocusScope.of(context).unfocus();
             }),
          child: Container(
            padding:  const EdgeInsets.only(right: 12,left: 12,top: 6),                                                           
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,        
                 children:  [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children:[
                      CircleAvatar(
                        radius: 70,
                         child: ClipOval(
                          child: Image.file(File(widget.img.path),
                          fit: BoxFit.cover,
                          width: 135,
                          height: 135,
                        ),
                      ),
                    ),
                   ],
                 ),
              const SizedBox(height: 4,),
               Container(          
                child: Form(
                  key: _formKey,
                   child: Column(
                     children: [
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                              labelStyle:  TextStyle(
                               fontSize: 14,
                               color: Colors.grey.shade400,
                                fontWeight: FontWeight.w600,
                              ),
                              prefixIcon:const Icon(Icons.person,size: 21),
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
                      const SizedBox(height: 5,),
                       TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Contact Number',
                                 labelStyle:  TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w600,
                                  ),
                                 prefixIcon: const Icon(Icons.call,size: 21,),
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
                                  return 'Please enter vaild number';
                                }
                                return null;
                              },          
                              onChanged: (value) => number=value,
                            ),
                            ], 
                         ),
                      ),
                    ),
                    const SizedBox(height: 2,), 
     Container(           
       child: Column(
         children: [
           const  SizedBox(height: 8,),
           const  Text('Select the below option ',
           style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,            
           ),),
            const SizedBox(height: 10),             
          Row(           
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [            
              Column(               
                children: [                 
                 Transform.scale(               
                 scale: 3.0,             
                 child: Checkbox(                                                                 
                 activeColor: Colors.red.shade400,   
                 checkColor: Colors.white,                                  
                 value: value1,                               
                 onChanged: (bool ?value) {                                     
                   _controller.text = '20 Mins';
                   _controller.selection = TextSelection.fromPosition(
                     TextPosition(offset: _controller.text.length),                     
                     );
                 setState(() {
                   visitorType='Deliverey';
                   durationtime = 'Twenty Mins';
                   value1 = value!;
                   value2=false;
                   value3=false;
                   value4=false; 
                   textreadonly = true;                                                   
                 });                
               }              
             ), 
           ),
            const SizedBox(height: 5,),
               Text('Delivery'),
           ],
         ),
          Column(
            children: [
              Transform.scale(
                 scale: 3.0,
                 child: Checkbox(
                 activeColor: Colors.blue,                              
                 value: value2,
                 splashRadius: 20,                 
                 onChanged: (bool ?value) {                  
                   _controller.text = '24 Hours';                  
                   _controller.selection = TextSelection.fromPosition(
                     TextPosition(offset: _controller.text.length)
                     );
                 setState(() {
                   visitorType='Family';
                   durationtime = 'TwentyFour Hours';
                   value2 = value!;
                   value1=false;
                   value3=false;
                   value4=false;
                   textreadonly = true;  
                 });
                }
               ),
             ),
              const SizedBox(height: 5,),
               const Text('Family'),
          ],
        ),
           Column(
             children: [
               Transform.scale(
                 scale: 3.0,
                 child: Checkbox(
                 activeColor: Colors.green,                             
                 value: value3,
                 splashRadius: 20,
                 onChanged: (bool ?value) {
                   _controller.text = '2 Hours';
                     _controller.selection = TextSelection.fromPosition(
                     TextPosition(offset: _controller.text.length)
                     );
                 
                 setState(() {
                   visitorType='Service';
                   durationtime = 'Two Hours';
                   timeSpan = 120;
                   value3 = value!;
                   value1=false;
                   value2=false;
                   value4=false;
                    textreadonly = true;  
                 });
                }
               ),
              ),
               const SizedBox(height: 5,),
               const Text('Services'),
             ],
           ), 
          Column(
            children: [
              Transform.scale(                
                 scale: 3.0,
                 child: Checkbox(
                 activeColor: Colors.blueGrey,                          
                 value: value4,
                 splashRadius: 20,                 
                 onChanged: (bool ?value) { 
                   _controller.text = '';                  
                    _controller.selection = TextSelection.fromPosition(
                     TextPosition(offset: _controller.text.length)
                     );
                 setState(() {  
                   visitorType='Other';
                   durationtime = _controller.text;                 
                   value4 = value!;
                   textreadonly=false;
                   value1=false;
                   value3=false;
                   value2=false; 
                   textreadonly = false;                               
                  });                 
                }            
               ),
              ),
               const SizedBox(height: 5,),
               const Text('Others'),
               ],
             ),        // 
            ],
          ),
          const SizedBox(height: 8,),
            TextField(
                  controller: _controller,  
                   readOnly: textreadonly,                                              
                   decoration: InputDecoration(
                   labelText: 'Time Span',
                   labelStyle:  TextStyle(
                   fontSize: 14,
                   color: Colors.grey.shade400,
                   fontWeight: FontWeight.w600,
                  ),
                   prefixIcon:const Icon(Icons.timer,size: 21),
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
              ), 
            ],
        ),
     ),
                   const SizedBox(height: 10,),               
                     Container(                                           
                      child: TextButton(                                                                                                                                                                                                                                              
                        child:Ink(decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.indigoAccent                                                 
                              ),
                               child: Container(
                                alignment: Alignment.center,                            
                                constraints:const BoxConstraints(
                                  maxWidth: 140,
                                  minHeight: 40
                                ), 
                                child: const Text('Create Profile',
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
                              Navigator.push(
                              context, MaterialPageRoute(builder: (context) => ViewVisitorProfile(
                                name:_fullName,
                                numb: number,
                                image: widget.img.path,
                                duration: durationtime,
                                typeOfvisitor: visitorType ,
                                timeSpan1: timeSpan,
                                 )));
                              showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                              title:const  Text("Alert !",
                              style: TextStyle(
                              fontSize: 20,                    
                             ),
                            ),
                              content: const Text("Successfully registered"),
                              actions: <Widget>[
                              TextButton(                                
                              onPressed: () {
                              Navigator.of(ctx).pop();
                              
                            },                              
                              child: const Text("Done"),
                          ),
                        ],
                      ),
                    );
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
}