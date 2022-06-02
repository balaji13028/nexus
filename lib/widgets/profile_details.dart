
import 'package:flutter/material.dart';
import 'package:flutter_application/models/visitor_details_model.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({ Key? key }) : super(key: key);

 

  @override
  Widget build(BuildContext context) { 
    Size size=MediaQuery.of(context).size;   
    return Card(      
      margin:const EdgeInsets.symmetric(horizontal: 14.0,vertical: 4,),
      elevation:6.0,
      shadowColor: Colors.white,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),      
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
         height: 90,        
        child: Column(        
          children: [
            Row(            
              children:[
                 const CircleAvatar(
                  radius: 32.0,
                  backgroundColor: Colors.deepPurple,
                  child: CircleAvatar(
                    radius: 30,
                  //backgroundImage:CachedNetworkImageProvider(currentUser.imageUrl),
                  ),
                  ),                 
                const SizedBox(width: 15,),
                Column(
                  children: const [
                    Text('Hi',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  Text('Name:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                 ),
                 Text('Role:',
                 style: TextStyle(
                   fontSize: 14,
                   color: Colors.grey,
                 ),
                ),
               ],
               ),
               SizedBox(width: size.width*0.372),
                IconButton(
                   icon:const Icon(Icons.edit),
                   iconSize: 28.0,
                   color: Colors.grey,
                   onPressed: () {
                    
                   },
                ),
              ],                      
            ),                                               
          ],
        
        ),
      ), 
    );    
  }
}