import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/admin_module/admin_homepage.dart';
import 'package:flutter_application/api_url.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';



class AdminCreateVisitor extends StatefulWidget {
  
  final File img;
  
 const AdminCreateVisitor({ Key? key, required this.img }) : super(key: key);

  @override
  State<AdminCreateVisitor> createState() => _AdminCreateVisitorState();
}

class _AdminCreateVisitorState extends State<AdminCreateVisitor> {
   
  final _formKey = GlobalKey<FormState>();
 final TextEditingController _controller = TextEditingController();
 
 

  

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
  String blockname='';
  String number = '';
  String  flatno='';
  String others='';

  @override
  Widget build(BuildContext context) {    
    Size size=MediaQuery.of(context).size;
    final String imagepath=widget.img.path;
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Create Visitor',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.1,
            color: Colors.white                        
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 30, 82, 134), 
      ),     
        resizeToAvoidBottomInset: false,    
          body: GestureDetector(
            onTap: (() {
               FocusScope.of(context).unfocus();
             }),
            child: Container(
            height: size.height*1,
            decoration:  const BoxDecoration(
              color: Color.fromARGB(255, 30, 82, 134), 
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        SizedBox(
                          height: 200,
                          width: 360,                          
                            child: ClipRRect( 
                              borderRadius: BorderRadius.circular(0),                                                           
                              child: Image.file(File(imagepath),
                              fit: BoxFit.fitWidth,
                              filterQuality: FilterQuality.low,
                              //width: size.width*0.5,
                              //height: size.height*0.3,
                              )),
                        ),
                      ],
                  ),
                  const SizedBox(height: 1,),
                  Container(
                  height: size.height*0.56,
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
                                  maxLength: 1,                                                                         
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
                                     
                                      setState(() {
                                          visitorType='Delivery';
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
                                      _controller.text=others;                
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
                                    visitorType,
                                    flatno,
                                    blockname,
                                    _fullName,
                                    number,
                                    _controller.text,
                                     '--:--:--',
                                     '--/--/--',
                                     'null', 
                                     widget.img);
                                            
                                Navigator.push(                                  
                                       context, MaterialPageRoute(builder: (context) => const AdminHomepage()));                                                                                                                
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