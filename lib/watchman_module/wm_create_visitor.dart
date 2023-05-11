import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/api_url.dart';
import 'package:flutter_application/watchman_module/homepage_wm.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';



class CreateVisitorWM extends StatefulWidget {
  
  final File img;
  final String type,expectedDuration;
  
  const CreateVisitorWM({ Key? key, required this.img,required this.type,required this.expectedDuration}) : super(key: key);

  @override
  State<CreateVisitorWM> createState() => _CreateVisitorWMState();
}

class _CreateVisitorWMState extends State<CreateVisitorWM> {
   
  final _formKey = GlobalKey<FormState>();
 final TextEditingController _controller = TextEditingController();
 // ignore: prefer_typing_uninitialized_variables
 var visitorAdd;
 

  @override 
void initState() {
       _controller.text=widget.expectedDuration;
        visitorAdd=visitorsResponse();
  super.initState();
}
  
  bool value1 = false;
  bool value2 = false;
  bool value3 = false; 
  bool value4 = false;
  bool textreadonly = true;  
  String visitorType ='';
  String durationtime='';
  // ignore: unused_field, prefer_final_fields
  String _fullName = '';
  String blockname='';
  String number = '';
  String  flatno='';
  String others='';

  @override
  Widget build(BuildContext context) {  
    //print('type and time is ${widget.type} and ${widget.expectedDuration}');
    Size size=MediaQuery.of(context).size;
    final String imagepath=widget.img.path;
    return Scaffold( 
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0, 
        toolbarHeight: size.height*0.4,      
        backgroundColor: const Color.fromARGB(255, 30, 82, 134), 
        flexibleSpace: FlexibleSpaceBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(            
              children: [
                Container(                
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: IconButton(
                    onPressed:(() {
                      Navigator.push(context,MaterialPageRoute(builder:(context) => HomePageWM(),));
                    }), 
                    icon: const Icon(Icons.arrow_back,size: 28,color: Colors.black,),
                  ),
                ),
              ],
            ),
          ),
          expandedTitleScale: 1.0,
          titlePadding:const  EdgeInsets.only(bottom: 220),
          background: Image.file(File(imagepath),
            width: double.infinity,
            fit: BoxFit.cover,                
          ),
        ),
        bottom: PreferredSize(
          preferredSize:const  Size.fromHeight(16),
          child:  Container(
                  decoration:const  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                    )
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60)
                      ),
                      width: 30,
                      child: const Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ),
        ),
      ),     
        resizeToAvoidBottomInset: false,    
          body: GestureDetector(
            onTap: (() {
               FocusScope.of(context).unfocus();
             }),
            child: Container(
            height: size.height*1,
            decoration:  const BoxDecoration(
              color: Colors.white
          //  gradient: LinearGradient(
          // colors: [
          //   Color.fromRGBO(4, 9, 35, 1),
          //   Color.fromRGBO(39, 105, 171, 1),
          //   ],
          //    begin: FractionalOffset.bottomCenter,
          //    end: FractionalOffset.topCenter
          //  )
           ),  
            padding:  const EdgeInsets.only(right:0,left: 0,),                                                           
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,        
                 children:  [                                                      
                  const SizedBox(height: 1,),
                  Container(
                  height: size.height*0.53,
                  padding:  const EdgeInsets.only(right:24,left: 24,), 
                  decoration: const BoxDecoration( 
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      topLeft: Radius.circular(6),
                     
                      ),
                    ), 
                                        
                 child: SingleChildScrollView(
                   scrollDirection: Axis.vertical,
                     child: Form(
                       key: _formKey,          
                        child: Column(
                         children: [   
                          const SizedBox(height: 20,),                       
                          TextFormField(
                            textCapitalization: TextCapitalization.words,
                            
                              decoration: InputDecoration(
                                labelText: 'Name',
                                  labelStyle:  TextStyle(
                                   fontSize: 14,
                                   color: Colors.grey.shade600,
                                  
                                  ),
                                  prefixIcon:const Icon(Icons.person,size: 21,color:Colors.black54),
                                  enabledBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(6),
                                     borderSide: BorderSide(
                                     color: Colors.grey.shade500,
                                     ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(6),
                                     borderSide:BorderSide(
                                     color: Colors.grey.shade600,
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
                          const SizedBox(height: 20,),
                             TextFormField(
                               maxLength: 10,
                               keyboardType: TextInputType.phone,
                              
                                  decoration: InputDecoration(
                                    labelText: 'Contact Number',
                                     labelStyle:  TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                      
                                      ),
                                     prefixIcon: const Icon(Icons.call,size: 21,color:Colors.black54),
                                     enabledBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(6),
                                     borderSide: BorderSide(
                                     color: Colors.grey.shade500,
                                     ),
                                    ),
                                     focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(6),
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
                                  onChanged: (value) => number=value,
                                ),
                                                             
                                TextFormField(    
                                        textCapitalization: TextCapitalization.characters,                                                                                                        
                                        decoration: InputDecoration(
                                        labelText: 'flat no',
                                          labelStyle:  TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,                                          
                                        ),
                                          prefixIcon:const Icon(Icons.house_rounded,size: 21,color:Colors.black54),
                                          enabledBorder: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(6),
                                             borderSide: BorderSide(
                                             color: Colors.grey.shade500,
                                             ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(6),
                                             borderSide:BorderSide(
                                             color: Colors.grey.shade600,
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
                                         onChanged: (value) => flatno = value,
                                    ), 
                               const SizedBox(height: 20,), 
                               TextFormField(
                                  textCapitalization: TextCapitalization.characters, 
                                                                                                          
                                        decoration: InputDecoration(
                                        labelText: 'Block Name',
                                          labelStyle:  TextStyle(
                                           fontSize: 14,
                                           color: Colors.grey.shade600,
                                          
                                          ),
                                          prefixIcon:const Icon(Icons.house_rounded,size: 21,color:Colors.black54),
                                          enabledBorder: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(6),
                                             borderSide: BorderSide(
                                             color: Colors.grey.shade500,
                                             ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(6),
                                             borderSide:BorderSide(
                                             color: Colors.grey.shade600,
                                             ),
                                          ),
                                         floatingLabelBehavior : FloatingLabelBehavior.auto,
                                         ),
                                         validator: (value){
                                            if(value== null ||  value.trim().isEmpty){
                                              return 'Enter block name';
                                            }
                                            return null;
                                          },
                                         onChanged: (value) => blockname = value,
                                    ), 
                               const SizedBox(height: 20,), 
                                // ignore: avoid_unnecessary_containers
                                Container(           
                                   child: Column(
                                     children: [
                                      
                                       TextFormField(
                                 initialValue: widget.type,                                      
                                 readOnly: textreadonly,                                              
                                 decoration: InputDecoration(
                                 labelText: 'Type of visitor',
                                  labelStyle:  TextStyle(
                                  fontSize: 14,
                                   color: Colors.grey.shade600,
                                       
                                       ),
                                  prefixIcon:const Icon(Icons.timer,size: 21),
                                  enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(
                                  color: Colors.grey.shade500,
                                       ),
                                      ),
                                  focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:BorderSide(
                                   color: Colors.grey.shade500,
                                       ),
                                      ),
                                       floatingLabelBehavior : FloatingLabelBehavior.auto,
                                     ),
                                   ),
                          const SizedBox(height: 20,),
                            TextField(
                                 controller: _controller,  
                                 //readOnly: textreadonly,                                              
                                 decoration: InputDecoration(
                                 labelText: 'Time Span',
                                  labelStyle:  TextStyle(
                                  fontSize: 14,
                                   color: Colors.grey.shade600,
                                       
                                       ),
                                  prefixIcon:const Icon(Icons.timer,size: 21),
                                  enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(
                                  color: Colors.grey.shade500,
                                       ),
                                      ),
                                  focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:BorderSide(
                                   color: Colors.grey.shade500,
                                       ),
                                      ),
                                       floatingLabelBehavior : FloatingLabelBehavior.auto,
                                     ), 
                                    onChanged: (value) => others = value,
                                   ), 
                                 ],
                             ),
                           ),
                          const SizedBox(height: 28,),                                   
                          SizedBox(                                           
                             child: TextButton(                                                                                                                                                                                                                                              
                               child:Ink(decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: const Color.fromRGBO(39, 105, 170, 1),                                              
                                  ),
                                   child: Container(
                                    alignment: Alignment.center,                            
                                    constraints:const BoxConstraints(
                                      maxWidth: 220,
                                      minHeight: 45
                                    ), 
                                    child: const Text('Create',
                                    style: TextStyle(color: Colors.white,
                                    fontSize: 20,
                                    letterSpacing: 0.9,
                                    fontWeight: FontWeight.bold),
                                    textAlign:TextAlign.center,
                                    ),
                                  ),  
                                ),
                                onPressed: ()async{                                        
                                  if(
                                  _formKey.currentState!.validate()){
                                  _formKey.currentState!.save();
                                   await visitorApi(
                                    widget.type,
                                    flatno,
                                    blockname,
                                    _fullName,
                                    number,
                                    others,
                                     '--:--:--',
                                     '--/--/--',
                                     'null', 
                                     widget.img);
                                     visitorAdd;                                     
                                         
                                    Navigator.push(                                  
                                      context, MaterialPageRoute(builder: (context) =>  HomePageWM()));                                                                                                                
                                      EasyLoading.showSuccess('Created successfully',
                                      duration: const Duration(seconds: 2),
                                    );                                  
                                  }                                                                                                                                                                          
                                }                                                  
                              ),
                            ),  
                          const SizedBox(height: 15,),              
                        ]
                    ),
                  ),
                ),
              ), 
            ], 
          ),
        ),
      ),
    );
  }
}