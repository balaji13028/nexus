import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';



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
        splash: Image.asset('assets/images/nexus_logo.png',),
        // ignore: prefer_const_constructors
        nextScreen : LoginScreen(),
        splashTransition:SplashTransition.scaleTransition, 
                     
        duration: 1800,
        backgroundColor: const Color.fromRGBO(2,40,76,1),
         
      ),
      builder: EasyLoading.init(),
      
    );
  }
}

