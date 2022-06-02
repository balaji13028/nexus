import 'package:flutter/material.dart';
import 'package:flutter_application/api_url.dart';
import 'package:flutter_application/models/notice_model.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:intl/intl.dart';

import '../screens/home_screen.dart';

class AddNotice extends StatefulWidget {
 AddNotice({Key? key}) : super(key: key);

  @override
  State<AddNotice> createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {
 final _formKey = GlobalKey<FormState>();
 TextEditingController _titlecontroller  = TextEditingController();
 TextEditingController _desccontroller  = TextEditingController();
 TextEditingController _createdcontroller  = TextEditingController();
TextEditingController _startcontroller  = TextEditingController();
TextEditingController _endcontroller  = TextEditingController();
 String _title='';

  String _description='';

   String _startdate='';

    String _enddate='';

     String _by='';



 Future _startDate()  async {
       DateTime? pickedDate = await showDatePicker(
       context: context,
       initialDate: DateTime.now(),
       firstDate: DateTime(2000), 
       lastDate: DateTime(2101)
      );                  
        if(pickedDate != null ){
            String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);                        
                setState(() {
                   _startcontroller.text = formattedDate; //set output date to TextField value. 
                });
              }
                else{
                  print("Date is not selected");
               }
               _startdate=_startcontroller.text;
  }  


 Future _endDate()  async {
       DateTime? pickedDate = await showDatePicker(
       context: context,
       initialDate: DateTime.now(),
       firstDate: DateTime(2000), 
       lastDate: DateTime(2101)
      );                  
        if(pickedDate != null ){
            String date = DateFormat('dd-MM-yyyy').format(pickedDate);                        
                setState(() {
                   _endcontroller.text = date; //set output date to TextField value. 
                });
              }
                else{
                  print("Date is not selected");
               }
               _enddate=_endcontroller.text;
  }
@override
  void initState() {
    _startcontroller.text = "--/--/----"; //set the initial value of text field
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;   
      return Scaffold(      
        resizeToAvoidBottomInset: false,    
          body: 
             Container(            
            padding:  const EdgeInsets.only(right:0,left: 0,top: 22),                                                           
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,        
                 children:  [
                   Container(
                     height: size.height*0.35,
                     decoration: const BoxDecoration(                       
                        borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35),                     
                      ),
                       gradient: LinearGradient(
                      colors: [
                         Color.fromRGBO(4, 9, 35, 1),
                         Color.fromRGBO(39, 105, 171, 1),
                             ],
                         begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter
                       ),
                     ),
                     child: Column(
                       children: [
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
                              context, MaterialPageRoute(builder: (context) => HomeScreen()));
                             }
                             ),
                           ],
                         ), 
                  Padding(
                         padding: const EdgeInsets.only(left: 54),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,                 
                            children: const [                    
                               Text('Add a Notice',
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
                       ]
                     ),
                   ),             
                Container(
                  height: size.height*0.60,
                  padding:  const EdgeInsets.only(right:16,left: 16,top: 30), 
                  decoration: const BoxDecoration( 
                    color: Colors.white,                   
                    ),                       
                 child: SingleChildScrollView(
                   scrollDirection: Axis.vertical,
                     child: Form(
                         key: _formKey,
                         child: Column(
                                 children: [    
                                   Row(
                                     children: const [
                                        Text('Create a Notice',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.w500,
                                        ),)
                                     ],
                                   ),   
                              SizedBox(height: size.height*0.003,),
                              Divider(
                               color: Colors.grey.shade500,  
                               thickness: 1,         
                              
                                ), 
                                    SizedBox(height: size.height*0.012,),                                              
                              Row(               
                                children: [                                                                            
                                  
                                  Column(
                                     
                                      children: const[
                                        Text('Title ',
                                           style: TextStyle(
                                             fontSize: 16,
                                             color: Colors.black
                                           ),
                                           ),
                                      ]
                                  ),
                                 SizedBox(width: size.width*0.15,),
                                  Column(
                                     
                                    children: [
                                      Container(                                      
                                        height: size.height*0.08,
                                        width: size.width*0.65,
                                       child: TextFormField(
                                        controller: _titlecontroller,
                                       decoration: InputDecoration(                                                                
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
                                        return '*This fiels is required';
                                      }if(value.trim().length<4){
                                        return 'Name must be at least 4 charcters';
                                      }
                                      return null;
                                    },
                                  onChanged: (value) => _title=value,
                                   ),
                                 ),
                                           
                                ],
                               ),
                                      
                             ],
                            ),                                                          
                         Divider(
                           color: Colors.grey.shade400,                                       
                             ),
                               Row(               
                                children: [                                                                            
                                  
                                    Column(
                                     
                                      children: const[
                                        Text('Description',
                                           style: TextStyle(
                                             fontSize: 16,
                                             color: Colors.black
                                           ),
                                           ),
                                      ]
                                    ),
                                     SizedBox(width: size.width*0.025,),
                                    Column(
                                     
                                      children:[
                                           Container(
                                           height: size.height*0.08,
                                           width: size.width*0.65,
                                       child: TextFormField(
                                      controller:_desccontroller,
                                    decoration: InputDecoration(                                                                
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
                                        return '*This field is required';
                                      }
                                      return null;
                                    },
                                   onChanged: (value) => _description=value,
                                 ),
                                         ),
                                      ],
                                    ),
                                      
                                    ],
                                  ),
                                                             
                              Divider(
                               color: Colors.grey.shade400,           
                              
                                ),
                                                             
                            Row(               
                                children: [                                                                                                              
                                    Column(                                     
                                      children: const[
                                        Text('Start Date ',
                                           style: TextStyle(
                                             fontSize: 16,
                                             color: Colors.black
                                           ),
                                           ),
                                      ]
                                    ),
                                  SizedBox(width: size.width*0.038,),
                                    Column(                                     
                                      children: [
                                        Container(
                                          height: size.height*0.08,
                                          width: size.width*0.65,
                                             child: TextFormField(                                            
                                                controller: _startcontroller,  
                                                readOnly: true,  
                                                onTap: () => _startDate(),                                                                                                                                            
                                         decoration: InputDecoration( 
                                         
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
                                        return '*Please pick the Date';
                                      }
                                      return null;
                                    },
                                  onChanged: (value) => _startdate=value,
                                 ),
                                         ),
                                      ],
                                    ),
                                      
                                    ],
                                  ),
                                                           
                              Divider(
                               color: Colors.grey.shade400,           
                              
                                ),
                          Row(               
                                children: [                                                                                                             
                                    Column(
                                     
                                      children: const[
                                        Text('End Date',
                                           style: TextStyle(
                                             fontSize: 16,
                                             color: Colors.black
                                           ),
                                           ),
                                      ]
                                    ),
                                     SizedBox(width: size.width*0.0689,),
                                    Column(
                                     
                                      children: [
                                          Container(
                                           height: size.height*0.08,
                                           width: size.width*0.65,
                                          
                                       child: TextFormField(
                                        controller: _endcontroller,  
                                        readOnly: true,  
                                        onTap: () => _endDate() ,
                                    decoration: InputDecoration(                                                                
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
                                        return '*This field is required';
                                      }
                                      return null;
                                    },
                                   onChanged: (value) => _enddate=value,
                                 ),
                                         ),
                                      ],
                                    ),
                                    ],
                                  ),
                                                                 
                              Divider(
                               color: Colors.grey.shade400,           
                              
                                ),
                                  Row(               
                                children: [                                                                                                             
                                    Column(
                                     
                                      children: const[
                                        Text('Create By',
                                           style: TextStyle(
                                             fontSize: 16,
                                             color: Colors.black
                                           ),
                                           ),
                                      ]
                                    ),
                                     SizedBox(width: size.width*0.054,),
                                    Column(
                                     
                                      children: [
                                          Container(
                                           height: size.height*0.08,
                                           width: size.width*0.65,
                                          
                                       child: TextFormField(
                                       controller: _createdcontroller,
                                    decoration: InputDecoration(                                                                
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
                                        return '*This field is required';
                                      }
                                      return null;
                                    },
                                   onChanged: (value) => _by=value,
                                 ),
                                         ),
                                      ],
                                    ),
                                    ],
                                  ),
                                  SizedBox(height: size.width*0.1,), 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: size.height*0.06,
                                        width: size.width*0.38,                                      
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(6),
                                          color:const Color.fromRGBO(39, 105, 170, 1), 
                                       ),
                                        child: TextButton(  
                                           child:const Text('Create',
                                          style: TextStyle(
                                            fontSize: 20,
                                            letterSpacing: 0.8,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                          ),
                                          onPressed: (() {
                                             if(
                                     _formKey.currentState!.validate()){
                                     _formKey.currentState!.save();
                                      //  newNotice.title=_title;
                                      //  newNotice.description=_description;
                                      //  newNotice.startDate=_startdate;
                                      //  newNotice.endDate=_enddate;
                                      //  newNotice.createdby=_by;                   
                                      //   insertNotice(newNotice);
                                      //   notice();
                                      noticeApi(_titlecontroller.text, _desccontroller.text, _startcontroller.text, _endcontroller.text, _createdcontroller.text);
                                         Navigator.push(
                 context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                          }                                          
                                         }
                                        )                                          
                                        ),
                                      ),
                                    ],
                                  ) ,
                                  SizedBox(height: size.height*0.06,)
                                ],
                              ),
                       ),
                  
                ),
               ),
        
      ], 
                         ),
                      ),
                    
    );
  }
}