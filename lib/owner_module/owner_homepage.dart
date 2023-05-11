
import 'package:flutter/material.dart';
import 'owner-visitors.dart';
import 'owner_apartments.dart';
import '../models/apartment_model.dart';
import '../models/user_details_model.dart';
import '../models/visitor_details_model.dart';
import '../screens/login_screen.dart';
import '../user profile pages/user_profile.dart';
import 'owner_details.dart';


class HomepageOW extends StatefulWidget {
  const HomepageOW({Key? key}) : super(key: key);

  @override
  State<HomepageOW> createState() => _HomepageOWState();
}

class _HomepageOWState extends State<HomepageOW> {
   final GlobalKey<ScaffoldState> slidebar= GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return WillPopScope(
      
      onWillPop: () async{
        return false;
      },
      child: Scaffold( 
        resizeToAvoidBottomInset: false,     
          body: 
             Container(
              padding: EdgeInsets.only(top: size.height*0.05),          
                height:size.height*1.2,
                width: double.infinity,            
                decoration:const BoxDecoration(
                   gradient: LinearGradient(
                         colors: [
                        Color.fromRGBO(4, 9, 35, 1),
                       Color.fromARGB(255, 30, 82, 134),
                     ],
                         begin: FractionalOffset.bottomLeft,
                         end: FractionalOffset.topCenter)
                  ),
                child: Column(                  
                   crossAxisAlignment: CrossAxisAlignment.start,            
                   children:[ 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Column(      
                                                              
                           children:[                       
                             IconButton(icon:const Icon(Icons.person,
                             size: 34,
                             color: Colors.white,
                             ),
                              onPressed: () {
                               Navigator.push(
                     context, MaterialPageRoute(builder: (context) =>ViewProfile(details:userList[0])));
                              },     
                             ),
                           ],
                         ),
                         Column(
                         // mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Nexus',                      
                            style: TextStyle(
                              letterSpacing: 0.9,
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),)
                          ],
                         ),
                          Column(      
                           //mainAxisAlignment: MainAxisAlignment.start,                                   
                           children: [                       
                             IconButton(icon:const Icon(Icons.logout_rounded,
                             size: 30,
                             color: Colors.white,
                             ),
                             onPressed: (){
                              Navigator.push(
                     context, MaterialPageRoute(builder: (context) =>const LoginScreen()));
                             }
                             ),
                           ],
                         ),
                      ],
                    ),
                     SizedBox(height: size.height*0.01,),
                     OwnerDetails(user: userList,),                                       
                      Container(
                        padding: const EdgeInsets.only(top: 14),
                        height: size.height*0.325,
                        width: double.infinity,
                        decoration:const  BoxDecoration(                       
                          color: Colors.white
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(padding:  EdgeInsets.only(left:11.0),
                                child:  Text('Apartments list',        
                                  style:TextStyle(
                                  letterSpacing: 0.9,
                                  color: Colors.black87,
                                  fontSize: 21,           
                                  fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: OwnerApartments(details: flatList),
                              ),
                            ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8),
                        height: size.height*0.34,
                        width: double.infinity,
                        decoration: const BoxDecoration(                         
                          color: Colors.white
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(padding:  EdgeInsets.only(left:11.0),
                              child:  Text('Visitors Details',        
                                style:TextStyle(
                                  letterSpacing: 0.9,
                                  color: Colors.black87,
                                  fontSize: 21,           
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: OwnerVisitors(details:visList,),
                            ),
                          ],
                        ),
                      ),
                  ]      
                ),
          )
      )
    );  
  } 
}