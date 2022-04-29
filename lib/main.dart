import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/login_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home:AnimatedSplashScreen(
        splash: Image.asset('assets/images/SandMLogo.png',width: 150,),
        nextScreen : LoginScreen(),
        splashTransition:SplashTransition.fadeTransition, 
                     
        duration: 1000,
         backgroundColor: Colors.deepPurple.shade300,    
    
      ),
    );
  }
}

