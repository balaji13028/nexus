import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvator extends StatelessWidget {
  final String imageUrl;  
  const ProfileAvator({ Key? key, required this.imageUrl }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child:
      CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.deepPurple,
        child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: CachedNetworkImageProvider(imageUrl),
                                    
          ),        
    ),
      
    );
  }
}