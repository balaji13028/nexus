import 'package:flutter/material.dart';
import 'package:flutter_application/models/user_model.dart';

import 'profile_avator.dart';

class ListOfProfiles extends StatelessWidget {
  final List<User> onlineUsers;
  const ListOfProfiles({ Key? key, required this.onlineUsers }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
     margin:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5,),
      elevation:2.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(10)
        ),
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
           padding:  const EdgeInsets.symmetric(horizontal: 8),
           
               itemCount: 1 + onlineUsers.length,
               itemBuilder: (BuildContext context,int index){  
                 if(index== 0){
                   return const Padding(padding:EdgeInsets.symmetric(horizontal: 0),
                   );
                 }
                 final User user = onlineUsers[index-1];              
                return Padding(padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: ProfileAvator(imageUrl: user.imageUrl,
                  ),
                  );
                 }
        ),
      ),
    );
  }
}