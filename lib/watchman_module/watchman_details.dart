import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/models/user_details_model.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_application/watchman_module/wm_edit_details.dart';

import 'homepage_wm.dart';


// ignore: must_be_immutable
class WatchmanProfile extends StatelessWidget {
  UserProfileData details;
  WatchmanProfile({ Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var decodebyte= base64Decode(details.image!);
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0, 
        toolbarHeight: size.height*0.45,      
        backgroundColor: const Color.fromARGB(255, 30, 82, 134), 
        flexibleSpace: FlexibleSpaceBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(            
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context) => HomePageWM(),));
                  },
                  child: Container(                
                    height: 38,
                    width: 38,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child:const Icon(Icons.arrow_back,size: 24,color: Colors.black,),
                  ),
                ),
              ],
            ),
          ),
          expandedTitleScale: 1.0,
          titlePadding:const  EdgeInsets.only(bottom: 260),
          background:(decodebyte.isNotEmpty)? Image.memory(decodebyte,
            width: double.infinity,
            fit: BoxFit.cover,                
          ):
          Image.asset('assets/images/person logo.jpg',fit: BoxFit.cover,)
        ),
        bottom: PreferredSize(
          preferredSize:const  Size.fromHeight(16),
          child:  Container(
                  height: 40,                  
                  width: double.infinity,
                  decoration:const  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        const Text('Profile details :',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color:  Color.fromARGB(255, 36, 79, 122), 
                          ),
                        ),
                        IconButton(
                          onPressed:(){
                            Navigator.push(context,MaterialPageRoute(builder:(context) => EditWatchmanProfile(details: details),));
                          },
                          icon:const Icon(Icons.edit,
                            size: 24,
                            color:Color.fromARGB(255, 36, 79, 122), 
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child:Column(
          children: [                                   
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      
                       color:const Color.fromARGB(207, 4, 114, 141),
                    ),
                    child: const Icon(Icons.person,
                      color:Colors.white
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name : ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      Text("${details.firstName}",                        
                        style:const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500                          
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:const Color.fromARGB(218, 30, 92, 155), 
                    ),
                    child: const Icon(Icons.phone,
                      color:Colors.white
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Contact no :',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      Text("${details.number}",                        
                        style:const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500                          
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:const Color.fromARGB(195, 13, 83, 51), 
                    ),
                    child: const Icon(Icons.male,
                      color:Colors.white
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gender :',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      Text("${details.gender}",                        
                        style:const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500                          
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0.6,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      //color:Color.fromARGB(206, 122, 34, 34)
                      color:const Color(0xff7C5943),
                    ),
                    child:IconButton(
                      onPressed:() {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginScreen())));
                      },
                      icon:const Icon(Icons.logout_outlined,
                      color:Colors.white
                      )
                    ),
                  ),
                  const SizedBox(width: 20,),
                  const Text("Logout",                        
                        style:TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                                                    
                        ),
                      ),
                    ],
                  ),
                
              
            ),
          ],                                
        )
      ),
    );
  }
}