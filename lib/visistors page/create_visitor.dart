import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/api_url.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:flutter_application/screens/home_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';



class VisitorProfile extends StatefulWidget {
  
  final File img;
  
 const VisitorProfile({ Key? key, required this.img }) : super(key: key);

  @override
  State<VisitorProfile> createState() => _VisitorProfileState();
}

class _VisitorProfileState extends State<VisitorProfile> {
   
  final _formKey = GlobalKey<FormState>();
 final TextEditingController _controller = TextEditingController();
 TextEditingController namecontroller = TextEditingController();
 TextEditingController numbercontroller = TextEditingController();
 TextEditingController flatcontroller = TextEditingController();
 TextEditingController controller = TextEditingController();
 

  

  @override 
void initState() {
       
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

  String number = '';
  String  flatno='';

  @override
  Widget build(BuildContext context) {    
    Size size=MediaQuery.of(context).size;
   final String imagepath=widget.img.path;
      return Scaffold(      
        resizeToAvoidBottomInset: false,    
          body: GestureDetector(
            onTap: (() {
               FocusScope.of(context).unfocus();
             }),
            child: Container(
            height: size.height*1,
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
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,        
                 children:  [
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
                        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                       }
                       ),
                     ],
                   ), 
                  Padding(
                   padding: const EdgeInsets.only(left: 54),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,                 
                      children: const [                    
                         Text('Visitor Profile',
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
                   SizedBox(height: size.height*0.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children:[
                      CircleAvatar(
                        radius: 66,
                        backgroundColor:Colors.white70,
                         child: ClipOval(
                          child: Image.file(File(imagepath),
                          fit: BoxFit.cover,
                          width: 126,
                          height: 126,
                        ),
                      ),
                    ),
                   ],
                 ),
               SizedBox(height: size.height*0.08,),
                Container(
                  height: size.height*0.57,
                  padding:  const EdgeInsets.only(right:24,left: 24,top: 40), 
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
                          TextFormField(
                            textCapitalization: TextCapitalization.words,
                            controller: namecontroller,
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                  labelStyle:  TextStyle(
                                   fontSize: 14,
                                   color: Colors.grey.shade600,
                                  
                                  ),
                                  prefixIcon:const Icon(Icons.person,size: 21,color:Colors.black54),
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
                                    }if(value.trim().length<3){
                                      return 'Full name must be at least 3 charcters';
                                    }
                                    return null;
                                  },
                                 onChanged: (value) => newVisitor.visitorName=value,
                               ),
                          const SizedBox(height: 20,),
                             TextFormField(
                               maxLength: 10,
                               keyboardType: TextInputType.phone,
                               controller: numbercontroller,
                                  decoration: InputDecoration(
                                    labelText: 'Contact Number',
                                     labelStyle:  TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                      
                                      ),
                                     prefixIcon: const Icon(Icons.call,size: 21,color:Colors.black54),
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
                                  onChanged: (value) =>newVisitor.visitorNumber=value,
                                ),
                                                             
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: flatcontroller,
                                          maxLength: 3,
                                        decoration: InputDecoration(
                                        labelText: 'flat no',
                                          labelStyle:  TextStyle(
                                           fontSize: 14,
                                           color: Colors.grey.shade600,
                                          
                                          ),
                                          prefixIcon:const Icon(Icons.house_rounded,size: 21,color:Colors.black54),
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
                                              return 'Enter flat number';
                                            }
                                            return null;
                                          },
                                         onChanged: (value) => flatno = value,
                                    ), 
                               const SizedBox(height: 2,), 
                                // ignore: avoid_unnecessary_containers
                                Container(           
                                   child: Column(
                                     children: [
                                      const  SizedBox(height: 8,),          
                                      Row(           
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [            
                                       Column(               
                                       children: [                 
                                       Transform.scale(               
                                       scale: 2.0,             
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
                                          durationtime = '20 Mins'.toString();
                                          value1 = value!;
                                          value2=false;
                                          value3=false;
                                          value4=false; 
                                          textreadonly = true;                                                   
                                       }
                                       );                
                                    }              
                                  ), 
                                ),
                                 const SizedBox(height: 5,),
                                   // ignore: prefer_const_constructors
                                   Text('Delivery'),
                                ],
                              ),
                               Column(
                                 children: [
                                   Transform.scale(
                                      scale: 2.0,                 
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
                                      durationtime = '24 Hours'.toString();
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
                                      scale: 2.0,
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
                                      durationtime = '2 Hours'.toString();                
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
                                      scale: 2.0,
                                      child: Checkbox(
                                      activeColor: Colors.blueGrey,                          
                                      value: value4,
                                      splashRadius: 20,                 
                                      onChanged: (bool ?value) { 
                                      _controller.text;                 
                                      _controller.selection = TextSelection.fromPosition(
                                      TextPosition(offset: _controller.text.length)
                                     );
                                      setState(() {  
                                     visitorType='Other';
                                      durationtime = _controller.text.toString();                 
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
                                   color: Colors.grey.shade600,
                                       
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
                          const SizedBox(height: 22,),               
                           // ignore: avoid_unnecessary_containers
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
                                    child: const Text('Create Visitor',
                                    style: TextStyle(color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                    textAlign:TextAlign.center,
                                    ),
                                  ),  
                                ),
                                onPressed: ()async{                                        
                                  if(
                                  _formKey.currentState!.validate()){
                                  _formKey.currentState!.save();
                                  // newVisitor.inDate= DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
                                  //  newVisitor.inTime= DateFormat('kk:mm:ss').format(DateTime.now()).toString();
                                  //   newVisitor.outDate= '----/--/--';
                                  //    newVisitor.outTime= '--:--:--';
                                  //    newVisitor.typeOfVisitor = visitorType;
                                  //    newVisitor.expectedDuration = durationtime;
                                  //    newVisitor.timeElapsed="null";
                                  //    newVisitor.visitorImage=imagepath;
                                  //    insertVisitor(newVisitor);
                                  //    visit();  
                                  visitorApi(
                                    namecontroller.text,
                                    numbercontroller.text, 
                                    visitorType, 
                                    flatcontroller.text,
                                     _controller.text,
                                     "--:--:--",
                                     "--/--/----",
                                     "null",
                                     widget.img,);  
                                            
                                Navigator.push(                                  
                                       context, MaterialPageRoute(builder: (context) => const HomeScreen()));                                                                                                                
                                  EasyLoading.showSuccess('Created successfully',
                                   duration: const Duration(seconds: 3),
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