import 'package:flutter/material.dart';
import 'package:flutter_application/screens/login_verification.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../api_url.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
 String number='';
  


  // ignore: unused_element
  void _showToast(status) {
    Fluttertoast.showToast(
      msg: "user doesn't exist ? Create an acoount", // message
      toastLength: Toast.LENGTH_LONG, // length
      gravity: ToastGravity.BOTTOM, // location
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16,
      // duration
    );
  }

  void configLoading(status) {
    EasyLoading.showToast('Login Successfully',
        toastPosition: EasyLoadingToastPosition.bottom,
        maskType: EasyLoadingMaskType.black);
  }

  @override
  Widget build(BuildContext context) {
     Size size=MediaQuery.of(context).size;
    return WillPopScope(
      
      onWillPop: () async{
        return false;
      },
      child: Scaffold(      
        body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Color.fromRGBO(4, 9, 35, 1),
                     Color.fromARGB(255, 30, 82, 134),
                   // Color.fromRGBO(39, 105, 170, 1),
                         
                  ],
                      begin: FractionalOffset.bottomLeft,
                      end: FractionalOffset.topCenter)),
                  child: Stack(                                  
                    children: <Widget>[
                      Padding(
                         padding: const EdgeInsets.only(left:24,right:20,top: 30),                     
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            SizedBox(
                                height: size.height*0.05,
                              ),
                              const Text(
                                'Welcome',
                                style:
                                    TextStyle(fontSize: 26, fontWeight: FontWeight.w500,color: Colors.white),
                              ),
                              SizedBox(
                                height: size.height*0.01,
                              ),
                              Text(
                                'Enter Your Phone Number to continue',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey.shade100),
                              ),
                              SizedBox(height: size.height*0.0938,),                                                                                                                                                  
                                 Form(
                                   key: _formKey,
                                    child:TextFormField(                                                                                                                                                                            
                                    keyboardType: TextInputType.number,                        
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                    ),                       
                                    decoration: InputDecoration(                          
                                      labelText: '  Phone Number ',                          
                                      labelStyle:  TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade200,
                                      ),
                                      prefix: const Text('+91 - ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white
                                      ),),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 1.8
                                          
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),                               
                                    ),
                                    
                                     onChanged:  (value) => number=value,
                                                      
                                  ),
                                ),
                          
                              ]
                            ) 
                          
                        ), 
                         Align(
                          alignment: Alignment.bottomCenter,                           
                                 child:   TextButton(
                                   onPressed: () async {                                                                                                                                                  
                                    String value = await userLogin(number);                       
                                      if(value == "no data"){
                                        
                                        _formKey.currentState!.validate();
                                    EasyLoading.showToast('Please enter the details',
                                        toastPosition:
                                             EasyLoadingToastPosition.center,
                                       );
                                      }else if(value=="not exist") {
                                       
                                    EasyLoading.showToast('This number is not exist',
                                         toastPosition:
                                             EasyLoadingToastPosition.center,
                                       );
                                      }else{
                                       
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => LoginVerify(number: number,),
                                      
                                     ));
                                       
                                      }
                                      
                                                                  
                                     
                                    },
                                                                                                                                          
                                   child: Container( 
                                          height: size.height*0.067,                                                                                                                                                                          
                                         decoration:BoxDecoration(   
                                          borderRadius: BorderRadius.circular(2),                                                                                                                                                                      
                                         color:(number.length == 10)? const Color.fromARGB(255, 29, 76, 107): Colors.grey.shade600),
                                        alignment: Alignment.center,
                                      child:                                     
                                         const Text(
                                          'Continue',
                                          style: TextStyle(
                                             color: Colors.white,
                                            fontSize: 20,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w500),
                                       textAlign: TextAlign.center,
                                 ),
                                   )
                            ), 
                           ),
                         
                          ],
                    ),
                  ),
          ),
    );
  }
}
