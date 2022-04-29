import 'package:flutter/material.dart';
import 'package:flutter_application/data/data.dart';
import '../widgets/profile_avator.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({ Key? key }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    
    return Card(
      margin:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10,),
      elevation:2.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),      
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
         height: 75,        
        child: Column(        
          children: [
            Row(            
              children:[
                ProfileAvator(imageUrl:  currentUser.imageUrl,),
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
               const SizedBox(width: 145,),
                IconButton(
                   icon:const Icon(Icons.edit),
                   iconSize: 28.0,
                   color: Colors.grey,
                   onPressed: () {},
                ),
              ],                      
            ),                                               
          ],
        
        ),
      ), 
    );    
  }
}