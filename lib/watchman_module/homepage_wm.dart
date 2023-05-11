import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/api_url.dart';
import 'package:flutter_application/models/apartment_model.dart';
import 'package:flutter_application/models/user_details_model.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:flutter_application/watchman_module/otp_verify_family.dart';
import 'package:flutter_application/watchman_module/watchman_details.dart';
import 'package:flutter_application/watchman_module/wm_create_visitor.dart';
import 'package:flutter_application/watchman_module/wm_visitors_list.dart';
import 'package:image_picker/image_picker.dart';

import 'new_visitors_list.dart';


class HomePageWM extends StatefulWidget {

 const  HomePageWM({Key? key,}) : super(key: key);

  @override
  State<HomePageWM> createState() => _HomePageWMState();
}

class _HomePageWMState extends State<HomePageWM> {
  final _formKey = GlobalKey<FormState>();
    UserProfileData user=userList[0];
  var apartmentno;
  
  void getImage(String type,expectedDuration) async{      
   var _picPath;                
   final pic = await ImagePicker().pickImage(source:ImageSource.camera);
   
      //now lets asign the image path to our image file
     setState(() {
       
       _picPath = File(pic!.path);
       
     }); 
      
      Navigator.push(                 
          context, MaterialPageRoute(builder: (context) => CreateVisitorWM(img: _picPath,type: type,expectedDuration: expectedDuration,)));          
  }
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    var decodebytes=base64.decode(user.image!);    
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(                
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 InkWell(
                  onTap: (() {
                    flatResponse();
                    //Navigator.push(context,MaterialPageRoute(builder:(context) => NotifyHomePage(),));
                  }),
                   child: const Text('Hi,',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black
                    ),
                    ),
                 ),
                  InkWell(
                    onTap: (() {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => WatchmanProfile(details: user),));
                    }),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.black,
                      child: ClipOval(
                        child:(decodebytes.isNotEmpty)? Image.memory(decodebytes,
                         fit: BoxFit.cover,
                         width: size.width*0.135,height: size.height*0.075,
                        ):
                        Image.asset('assets/images/person logo.jpg',fit: BoxFit.cover,)
                      ),
                    ),
                  )
                ],
              ),
              elevation: 0,
              pinned: false,
              backgroundColor: const Color.fromARGB(255, 36, 79, 122), 
              expandedHeight: size.height*0.32,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/images/4.jpg",
                  width: double.infinity,
                  fit: BoxFit.cover,                
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),              
                child:  Container(
                    decoration:const  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)
                      )
                    ),
                    child: const Center(
                      child: SizedBox(                        
                        width: 30,
                        child: Divider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [                
                  SizedBox(                    
                    width: double.infinity,                                                   
                    child: Column(                          
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [                        
                          const Padding(
                            padding:  EdgeInsets.only(top:20.0,left: 18),
                            child:  Text('Select Visitor:',
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w500                                         
                              ),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.only(right:35,left: 35,top: 20,bottom: 22),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                InkWell(
                                  onTap: (){
                                    getImage('Delivery','20 mins');
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.delivery_dining_outlined,
                                        size: 32,
                                        color: Color(0xff7C5943),
                                      ),       
                                      SizedBox(height: 8,),
                                      Text('Delivery',
                                        style: TextStyle(fontSize: 16),),
                                    ],    
                                  ),
                                ),
                                 InkWell(
                                  onTap: (){
                                  _displayTextInputDialog(context);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.family_restroom,
                                        size: 28,
                                        color: Color(0xff7C5943),
                                      ),       
                                      SizedBox(height: 8,),
                                      Text('Family',
                                        style: TextStyle(fontSize: 16),),
                                    ],    
                                  ),
                                ),
                                 InkWell(
                                  onTap: (){
                                    getImage('Service','2 hours');
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.home_repair_service_outlined,
                                        size: 28,
                                        color: Color(0xff7C5943),
                                      ),       
                                      SizedBox(height: 8,),
                                      Text('Service',
                                        style: TextStyle(fontSize: 16),),
                                    ],    
                                  ),
                                ),
                                 InkWell(
                                  onTap: (){
                                    getImage('Others','');
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.devices_other_sharp,
                                        size: 28,
                                        color: Color(0xff7C5943),
                                      ),       
                                      SizedBox(height: 8,),
                                      Text('Others',
                                        style:  TextStyle(fontSize: 16),),
                                    ],    
                                  ),
                                ),
                              ]
                            ),
                          ) 
                        ],
                      ), 
                    ),
                    SizedBox(
                      child:Column(
                        children: const [
                          Padding(padding:  EdgeInsets.only(left: 18,bottom: 18),
                            child: Text('Recent Visitors',
                              style:TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ) ,
                    ),
                    WMVisitors(details: visList),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => WMListOfVisitors(details: visList,),));   
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 1,
                          child: Container(
                            width: 90,  
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 2),                  
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0,color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(18)
                            ),
                            child: const Text('See all',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff1E2852)
                            ),),
                          ),
                          )
                        ),
                    ],
                  ),
                  
                  const SizedBox(height: 25,),
                ]
              )
            )
          ],
        ),
      ),
    );
  }

  _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Apartment No :'),
          content: Form(
            key: _formKey,
            child: TextFormField(
              textCapitalization: TextCapitalization.characters,
              onChanged: (value) {
                apartmentno=value;
              },  
              validator: (value){
                if(value==null || value.trim().isEmpty){
                  return 'please enter flat no';
                }
                if(value.trim().length!=4){
                  return 'Please enter correct no';
                }
              },          
              decoration: const InputDecoration(hintText: "Enter here"),
            ),
          ),
          actions: <Widget>[
             TextButton(              
              child: Container(
                height: 36,
                width: 85,
                alignment: Alignment.center,
                color:  const Color.fromARGB(255, 36, 79, 122), 
                child: const Text('Continue',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,                 
                  ),  
                ),
              ),
              onPressed: () {
                if(
                _formKey.currentState!.validate()){
                 Navigator.push(context,MaterialPageRoute(builder:(context) =>  OtpVerify(apartmentNo: apartmentno,)));
                }
              },
            ),
          ],
        );
      }
    );
  }
}
