import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/apartment_model.dart';
import 'package:flutter_application/models/user_details_model.dart';
import 'package:flutter_application/notice/add_notice.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_application/screens/upi_screen.dart';
import 'package:flutter_application/widgets/list_of_notices.dart';
import 'package:image_picker/image_picker.dart';
import '../apartments/create_a_apartment.dart';
import '../models/notice_model.dart';
import '../models/visitor_details_model.dart';
import '../tenent_module/tenent_homepage.dart';
import '../user profile pages/edit_user_profile.dart';
import '../user profile pages/create_new_user.dart';
import '../user profile pages/user_profile.dart';
import 'a_create_visitor.dart';
import 'list_of_apartments.dart';
import 'a_visitors_list.dart';
import 'admin_details.dart';



class AdminHomepage extends StatefulWidget {

  const AdminHomepage({ Key? key }) : super(key: key);

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();

}

var _picPath;



class _AdminHomepageState extends State<AdminHomepage>{

  final GlobalKey<ScaffoldState> slidebar= GlobalKey();
    
  // now lets create a new function to get image from camera
  void getImage() async{
      
                   
   final pic = await ImagePicker().pickImage(source:ImageSource.camera);
   
      //now lets asign the image path to our image file
     setState(() {
       
       _picPath = File(pic!.path);
       
     });    
      await Navigator.push(                 
          context, MaterialPageRoute(builder: (context) => AdminCreateVisitor(img: _picPath)));
  }
  
  @override 
void initState() {
      
  super.initState();
}

  @override
  Widget build(BuildContext context) {
   
    Size size=MediaQuery.of(context).size;
    return WillPopScope(
      
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
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
          backgroundColor:const Color.fromRGBO(39, 105, 170, 1), 
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              iconSize: 24.0,
              color: Colors.white,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpiPyaments()));
              },
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        body:ListView(
          children:[ 
           Column(        
            crossAxisAlignment: CrossAxisAlignment.start,            
            children:[    
    
               Padding(
                 padding: const EdgeInsets.only(top: 15),
              child: ListOfNotices(details:noticeList),
               ),
    
              SizedBox(height: size.height*0.014,),
              Divider(
               color: Colors.grey.shade300,           
               thickness: 12,
             ),             
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14,vertical: 12),
              child:  Text('My Profile',        
               style:TextStyle(
                 letterSpacing: 1.1,
                 color: Colors.black87,
                 fontSize: 19,           
                 fontWeight: FontWeight.w600,
               ),
               ),
            ),
            AdminDetails(user: userList,),
             SizedBox(height: size.height*0.012,),
              Divider(
               color: Colors.grey.shade300,           
               thickness: 12,
             ),
              SizedBox(height: size.height*0.015,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14,vertical: 12),
              child:  Text('List of Visitor',        
               style:TextStyle(
                 letterSpacing: 1.1,
                 color: Colors.black87,
                 fontSize: 19,           
                 fontWeight: FontWeight.w600,
               ),
               ),
            ),
             AdminVisitorsList(details:visList,),
            SizedBox(height: size.height*0.012,),
              Divider(
               color: Colors.grey.shade300,           
               thickness: 12,
             ),      
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
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
                  SizedBox(width: size.width*0.3,),               
                ],
              ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListOfApartments(details: flatList),
              ),
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
               accountName: Text((userList.isEmpty)? '${details[0].firstName}' : userList[0].firstName!),
               accountEmail: Text((userList.isEmpty)? '${details[0].number}' : userList[0].number!),
               currentAccountPicture: CircleAvatar(
                 backgroundColor: Colors.grey,            
                child: ClipOval(                                                     
                            child:( userList.isEmpty)
                            ? Image.asset(details[0].image!,fit: BoxFit.cover,height: size.height*0.215,width: size.width*0.378,)
                            : Image.memory(base64Decode(userList[0].image!),fit:BoxFit.cover, height: size.height*0.215,width: size.width*0.4                                                                         
                          ),
                        ),                      
                 
                               
               ), 
               ),
               ListTile(  
                title: const Text("View profile"), 
                leading: const Icon(Icons.person),
               onTap: () {
               Navigator.push(
                   context, MaterialPageRoute(builder: (context) =>ViewProfile(details:userList[0])));
             },
                
                  
              ),
              ListTile(  
                title: const  Text("Edit profiles"), 
                leading: const Icon(Icons.edit), 
                 onTap: () {
               Navigator.push(
                   context, MaterialPageRoute(builder: (context) => EditProfile(details: userList[0],)));
                }, 
               ),  
               ListTile(  
                title: const Text("Settings"),  
              leading: const Icon(Icons.settings), 
              onTap: () {
              Navigator.push(
                   context, MaterialPageRoute(builder: (context) =>const HomepageTN()));
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
          color: Colors.white70, 
          elevation: 50,
          
          notchMargin: 3,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,        
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width*0.03),
                child: IconButton(
                   icon: const Icon(Icons.person_add),
                   iconSize: 33,
                    color: const Color.fromRGBO(39, 105, 170, 1),
                   onPressed: (){
                     Navigator.push(                 
                        context, MaterialPageRoute(builder: (context) => const NewUser()));
                   },
                 ),
              ),
                 SizedBox(width: size.width*0.15),
                
                   IconButton(
                   icon: const Icon(Icons.add_card),
                   color: const Color.fromRGBO(39, 105, 170, 1),
                   iconSize: 33,
                   onPressed: (){
                     Navigator.push(                 
                        context, MaterialPageRoute(builder: (context) => const AddNotice()));
                     
                   },),
                 
                  SizedBox(width: size.width*0.15),
                  IconButton(
                   icon: const Icon(Icons.add_home_sharp),
                   color: const Color.fromRGBO(39, 105, 170, 1),
                   iconSize: 33,
                   onPressed: (){
                     Navigator.push(                 
                        context, MaterialPageRoute(builder: (context) => CreateApartment()));
                     
                   },),
                 
            ],
          ),
        ),  
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,      
        floatingActionButton: FloatingActionButton(   
          autofocus: true,
          isExtended: true, 
          child: const Icon(Icons.add,size: 35,),                 
          backgroundColor:const Color.fromRGBO(39, 105, 170, 1),
          onPressed: ()async{
           getImage(); 
          
          },
        )
      ),
    );
  }
}

