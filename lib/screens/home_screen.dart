import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/api_url.dart';
import 'package:flutter_application/models/apartment-model.dart';
import 'package:flutter_application/models/user_details_model.dart';
import 'package:flutter_application/notice/add_notice.dart';

import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_application/widgets/list_of_notices.dart';
import 'package:flutter_application/widgets/list_of_visitors.dart';
import 'package:image_picker/image_picker.dart';
import '../apartments/create_a_apartment.dart';

import '../models/notice_model.dart';
import '../models/visitor_details_model.dart';
import '../user profile pages/edit_user_profile.dart';
import '../user profile pages/create_new_user.dart';
import '../user profile pages/user_profile.dart';
import '../visistors page/create_visitor.dart';
import '../widgets/list_of_apartments.dart';
import '../widgets/profile_details.dart';



class HomeScreen extends StatefulWidget {

  HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
} var _picPath;
  var _picpicker;

class _HomeScreenState extends State<HomeScreen>{
  final GlobalKey<ScaffoldState> slidebar= GlobalKey();
  
   @override
  void initState() {
  
   noticesResponse();
   

    super.initState();
    _picpicker = new ImagePicker();
  }
  
  // now lets create a new function to get image from camera
  void getImage() async{
   final pic = await _picpicker.pickImage(source:ImageSource.camera);
  
      //now lets asign the image path to our image file
     setState(() {
      
       _picPath = File(pic!.path);
       
     });    
      
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => VisitorProfile(img: _picPath)));       
  }
  
   listNotices() {
      ListOfNotices(details:noticeList);
        
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      key: slidebar, 
      appBar: AppBar(      
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 26.0,
          color: Colors.white,
          onPressed: () => slidebar.currentState?.openDrawer(),                
        ),    
        title: const Text('Nexus Apartments',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
          
        ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,      
        backgroundColor:Color.fromRGBO(39, 105, 170, 1), 
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            iconSize: 24.0,
            color: Colors.white,
            onPressed: (){},
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body:ListView(
        children:[ Column(        
          crossAxisAlignment: CrossAxisAlignment.start,            
          children:[  
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
            child:  Row(
              children: [
                Column(
                  children: const [
                    Text('Notice',        
                     style:TextStyle(
                       letterSpacing: 1.1,
                       color: Colors.black87,
                       fontSize: 19,           
                       fontWeight: FontWeight.w600,
                     ),
                     ),
                  ],
                ),
               
                SizedBox(width: size.width*0.6,),
                Column(                
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromRGBO(39, 105, 170, 1), 
                      ),
                      child: IconButton(
                         icon: const Icon(Icons.add),
                         iconSize: 30,
                         color: Colors.white,
                         onPressed: (){
                           Navigator.push(
                 context, MaterialPageRoute(builder: (context) => AddNotice()));
                         },),
                    )
                  ],
                )
              ],
            ),
          ),
          //ListOfNotices(details:noticeList),
          SizedBox(height: size.height*0.014,),
            Divider(
             color: Colors.grey.shade300,           
             thickness: 12,
           ),             
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14,vertical: 12),
            child:  Text('User Profile',        
             style:TextStyle(
               letterSpacing: 1.1,
               color: Colors.black87,
               fontSize: 19,           
               fontWeight: FontWeight.w600,
             ),
             ),
          ),
           const ProfileDetails(),
           SizedBox(height: size.height*0.012,),
            Divider(
             color: Colors.grey.shade300,           
             thickness: 12,
           ),
            SizedBox(height: size.height*0.015,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14,vertical: 12),
            child:  Text('Visitor Details',        
             style:TextStyle(
               letterSpacing: 1.1,
               color: Colors.black87,
               fontSize: 19,           
               fontWeight: FontWeight.w600,
             ),
             ),
          ),
           ListOfProfiles(details:visList,localdata: data,),
          SizedBox(height: size.height*0.014,),
            Divider(
             color: Colors.grey.shade300,           
             thickness: 12,
           ),      
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
            child:  Row(
              children: [
                Column(
                  children: const [
                    Text('List Of Apartments',        
                     style:TextStyle(
                       letterSpacing: 1.1,
                       color: Colors.black87,
                       fontSize: 19,           
                       fontWeight: FontWeight.w600,
                     ),
                     ),
                  ],
                ),
                SizedBox(width: size.width*0.26,),
                Column(                
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromRGBO(39, 105, 170, 1), 
                      ),
                      child: IconButton(
                         icon:const Icon(Icons.add),
                         iconSize: 30,
                         color: Colors.white,
                         onPressed: (){
                           Navigator.push(
                 context, MaterialPageRoute(builder: (context) => CreateApartment()));
                         },),
                    )
                  ],
                )
              ],
            ),
          ),
            ListOfApartments(details: flatList),
            SizedBox(height: size.height*0.1,)
          ],
        ),
        ]
      ), 
       drawer: Drawer( 
         width: 280, 
        elevation: 10.0,  
        child: Column(          
          children:<Widget>[ 
           UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
        color: Color.fromRGBO(39, 105, 170, 1), 
           ),            
             accountName: Text((newUser.firstName == null)? '${details[0].firstName}' : newUser.firstName!),
             accountEmail: Text((newUser.number == null)? '${details[0].number}' : newUser.number!),
             currentAccountPicture: CircleAvatar(
               backgroundColor: Colors.grey,            
              child: ClipOval(                                                     
                          child:( newUser.image == null)
                          ? Image.asset(details[0].image!,fit: BoxFit.cover,height: size.height*0.215,width: size.width*0.378,)
                          : Image.file(File(newUser.image!),fit:BoxFit.cover, height: size.height*0.215,width: size.width*0.4                                                                         
                        ),
                      ),                      
               
                             
             ), 
             ),
             ListTile(  
              title: const Text("View profile"), 
              leading: const Icon(Icons.person),
             onTap: () {
             Navigator.push(
                 context, MaterialPageRoute(builder: (context) =>ViewProfile(details:newUser)));
           },
              
                
            ),
            ListTile(  
              title: const  Text("Edit profiles"), 
              leading: const Icon(Icons.edit), 
               onTap: () {
             Navigator.push(
                 context, MaterialPageRoute(builder: (context) => EditProfile(details: newUser,)));
              }, 
             ),  
             ListTile(  
              title: const Text("Settings"),  
            leading: const Icon(Icons.settings), 
            onTap: () {
          
              
            
           },
            ),  
            ListTile(  
              title: const  Text("LogOut"),  
              leading: 
                const Icon(Icons.logout),              
                onTap: () {
             Navigator.push(
                 context, MaterialPageRoute(builder: (context) =>const LoginScreen()));
           },
                 
              ),
             
          ],  
        ),  
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(39, 105, 170, 1), 
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,        
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: IconButton(
                 icon: const Icon(Icons.person_add),
                 iconSize: 35,
                  color: Colors.white70,
                 onPressed: (){
                   Navigator.push(
                 context, MaterialPageRoute(builder: (context) => NewUser()));
                 },
                 ),
            ),
               SizedBox(width: size.width*0.485),
               Padding(
                 padding: const EdgeInsets.only(right: 30),
                 child: IconButton(
                 icon: const Icon(Icons.delete),
                 color: Colors.white70,
                 iconSize: 35,
                 onPressed: (){
                  
                   
                 },),
               )
          ],
        ),
      ),  
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,      
      floatingActionButton: FloatingActionButton(        
        child: const Icon(Icons.add,size: 42,),                 
        backgroundColor:const Color.fromRGBO(39, 105, 170, 1),
        onPressed: (){
          getImage();          
        },
      )
    );
  }
}

