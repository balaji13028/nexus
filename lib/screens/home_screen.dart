import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/data/data.dart';
import 'package:flutter_application/models/user_details_model.dart';
import 'package:flutter_application/screens/home_page.dart';
import 'package:flutter_application/screens/login_screen.dart';

import 'package:flutter_application/widgets/list_of_profiles.dart';
import 'package:image_picker/image_picker.dart';
import '../user profile pages/edit_profile_body.dart';
import '../user profile pages/new_user_profile.dart';
import '../user profile pages/view_profile_details.dart';
import '../visistors page/visitor_profile.dart';
import '../widgets/profile_details.dart';



class HomeScreen extends StatefulWidget {

  HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
} var _picPath;
  var _picpicker;

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> slidebar= GlobalKey();

   @override
  void initState() {
    super.initState();
    _picpicker = new ImagePicker();
  }
  // now lets create a new function to grt image from camera
  void getImage() async{
   final XFile? pic = await _picpicker.pickImage(source:ImageSource.camera);
  
      //now lets asign the image path to our image file
     setState(() {
       _picPath = File(pic!.path);
     });    
      
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => VisitorProfile(img: _picPath)));       
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: slidebar, 
      appBar: AppBar(      
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.grey,
          onPressed: () => slidebar.currentState?.openDrawer(),                
        ),    
        title: const Text('S&M Scholarly Solutions',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
          
        ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,      
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            iconSize: 26.0,
            color: Colors.grey,
            onPressed: (){},
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body:Column(       
        children:[
          const ProfileDetails(),
         ListOfProfiles(onlineUsers: onlineUsers,),
        ],
      ), 
       drawer: Drawer(  
        elevation: 10.0,  
        child: Column(          
          children:<Widget>[ 
           const UserAccountsDrawerHeader(
             accountName: Text('S&M'),
             accountEmail: Text('contact@goscholarly.com'),
             currentAccountPicture: CircleAvatar(
               backgroundColor: Colors.grey,
               backgroundImage: AssetImage('assets/images/SandMLogo.png',), 
                             
             ), 
             ),
             ListTile(  
              title: const Text("View profile"), 
              leading: const Icon(Icons.person),
             onTap: () {
             Navigator.push(
                 context, MaterialPageRoute(builder: (context) =>ViewProfile(details: details[0],)));
           },
              
                
            ),
            ListTile(  
              title: const  Text("Edit profiles"), 
              leading: const Icon(Icons.edit), 
               onTap: () {
             Navigator.push(
                 context, MaterialPageRoute(builder: (context) => EditProfile()));
              }, 
             ),  
             ListTile(  
              title: const Text("Settings"),  
            leading: const Icon(Icons.settings), 
            onTap: () {
             Navigator.push(
                 context, MaterialPageRoute(builder: (context) => HomePage()));
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
        color: Colors.deepPurple,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,        
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: IconButton(
                 icon: const Icon(Icons.person_add),
                 iconSize: 35,
                  color: Colors.white54,
                 onPressed: (){
                   Navigator.push(
                 context, MaterialPageRoute(builder: (context) => NewUser()));
                 },
                 ),
            ),
              const SizedBox(width: 170,),
               Padding(
                 padding: const EdgeInsets.only(right: 30),
                 child: IconButton(
                 icon: const Icon(Icons.emoji_events),
                 color: Colors.white54,
                 iconSize: 35,
                 onPressed: (){},),
               )
          ],
        ),
      ),  
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,size: 45,),                 
        backgroundColor: Colors.indigo,
        onPressed: (){
          getImage();
          
        },
      )
    );
  }
}

