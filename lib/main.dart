import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:overlay_support/overlay_support.dart';

class MyBehavior extends ScrollBehavior{
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,Widget child, ScrollableDetails details)
    {
      return child;
    }  
}
void main() async {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    var loader= EasyLoading.init();
    return OverlaySupport(
      child: MaterialApp( 
              
         debugShowCheckedModeBanner: false,
        home:AnimatedSplashScreen(
          splash: Image.asset('assets/images/nexus_logo.png',),
          // ignore: prefer_const_constructors
          nextScreen : LoginScreen(),
          splashTransition:SplashTransition.scaleTransition, 
                       
          duration: 1800,
          backgroundColor: const Color.fromRGBO(2,40,76,1),
           
        ),
        builder:EasyLoading.init(builder:(context ,child){
           
          return ScrollConfiguration(
             
            behavior:MyBehavior() , child: child!);
        }, 
        )       
      ),
    );
  }
}

