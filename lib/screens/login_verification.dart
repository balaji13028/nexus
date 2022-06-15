import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/api_url.dart';
import 'package:flutter_application/screens/home_screen.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginVerify  extends StatelessWidget {
  final String number;

LoginVerify({Key? key,required this.number}) : super(key: key);

String num1='';
String num2='';
String num3='';
String num4='';
String num5='';

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
   return  Scaffold(
     resizeToAvoidBottomInset: false,
      body: 
          Container(  
            padding: const EdgeInsets.only(top: 20),                                    
             child: 
              Column(   
              mainAxisAlignment:MainAxisAlignment.start ,
                                        
               children:[ 
                  Row(
                    children: [                                                                      
                      IconButton(icon:const Icon(Icons.arrow_back_sharp,
                        size: 30,
                         color: Colors.black87,
                      ),
                   onPressed: (){
                     Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                     }
                   ),
                 ],
               ), 
            SizedBox(height: size.height*0.03,),
             Padding(
                padding: const EdgeInsets.only(left: 20,right: 45),
                child: Text('Enter the 5 digit OTP sent to'' $number',
                    style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                   ),
                ),
                
              ),
             SizedBox(height: size.height*0.054,),
             Padding(
               padding: const EdgeInsets.only(left: 20,right: 75),
               child: Form(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     SizedBox(
                      height: 44,
                       width: 44,
                       child: TextFormField(
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.number,
                         textAlign: TextAlign.center,
                         inputFormatters: [
                           LengthLimitingTextInputFormatter(1),
                           FilteringTextInputFormatter.digitsOnly,
                         ],
                         decoration: InputDecoration(                                                                                        
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.8                                    
                                  ),
                                ),
                                 focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.8  
                                  ),
                                ),
                              ),
                          onChanged: ((value) {
                           if(value.length == 1){
                             FocusScope.of(context).nextFocus();
                           }
                           num1=value;
                          }
                       ),
                       ),
                     ),
                     SizedBox(
                       height: 44,
                       width: 44,
                       child: TextFormField(
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.number,
                         textAlign: TextAlign.center,
                         inputFormatters: [
                           LengthLimitingTextInputFormatter(1),
                           FilteringTextInputFormatter.digitsOnly,
                         ],
                         decoration: InputDecoration(                                                                                        
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.8                                    
                                  ),
                                ),
                                 focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.8  
                                  ),
                                ),
                              ),
                          onChanged: ((value) {
                           if(value.length == 1){
                             FocusScope.of(context).nextFocus();
                           }
                           num2=value;
                          }
                       ),
                     ),
                     ),
                     SizedBox(
                      height: 44,
                       width: 44,
                       child: TextFormField(
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.number,
                         textAlign: TextAlign.center,
                         inputFormatters: [
                           LengthLimitingTextInputFormatter(1),
                           FilteringTextInputFormatter.digitsOnly,
                         ],
                         decoration: InputDecoration(                                                                                        
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.8                                    
                                  ),
                                ),
                                 focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.8  
                                  ),
                                ),
                              ),
                          onChanged: ((value) {
                           if(value.length == 1){
                             FocusScope.of(context).nextFocus();
                           }
                           num3=value;
                          }
                       ),
                     ),
                     ),
                     SizedBox(
                      height: 44,
                       width: 44,
                       child: TextFormField(
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.number,
                         textAlign: TextAlign.center,
                         inputFormatters: [
                           LengthLimitingTextInputFormatter(1),
                           FilteringTextInputFormatter.digitsOnly,
                         ],
                         decoration: InputDecoration(                                                                                        
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.8                                    
                                  ),
                                ),
                                 focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.8  
                                  ),
                                ),
                              ),
                          onChanged: ((value) {
                           if(value.length == 1){
                             FocusScope.of(context).nextFocus();
                           }
                           num4=value;
                          }
                       ),
                     ),
                     ),
                     SizedBox(
                      height: 44,
                       width: 44,
                       child: TextFormField(                      
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.number,
                         textAlign: TextAlign.center,
                         inputFormatters: [
                           LengthLimitingTextInputFormatter(1),
                           FilteringTextInputFormatter.digitsOnly,
                         ],
                         decoration: InputDecoration(                                                                                        
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.8                                    
                                  ),
                                ),
                                 focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.8  
                                  ),
                                ),
                              ),
                          onChanged: ((value) {
                           
                            num5=value;
                           }
                          ),
                       ),
                      )
                     ]
                   ),
                  ),
               ),
               SizedBox(height: size.height*0.02,),            
              Padding(
                padding: EdgeInsets.only(left:14.0,right: size.width*0.55),
                child: TextButton(
                     onPressed:()async{
                        String num= await userLogin(number);
                     },
                      child: Container(   
                           padding: const EdgeInsets.only(left: 18),                         
                           height: size.height*0.047,                                                                                                                                                                          
                           decoration:BoxDecoration(  
                           borderRadius: BorderRadius.circular(10),                                                                                                                          
                           color:const Color.fromRGBO(39, 105, 170, 1)),
                           alignment: Alignment.centerLeft,
                        child:                                     
                           Text('Resend OTP',                          
                          style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade100,
                          fontWeight: FontWeight.w500
                        ),
                    ),
                      )
                  ),
              ),
               
             SizedBox(
               height: size.height*0.46,
              ),
              Container(                                                                                                                                       
                 decoration: const BoxDecoration(                                                                                   
                 color:  Colors.grey),
                 alignment: Alignment.center,
                 child: TextButton(
                    onPressed: () async {                    
                        String num= await Verifyapi(num1, num2, num3, num4, num5,number);
                            if(num == 'valid'){
                               EasyLoading.showSuccess(
                                 "Successfully registered",
                                  duration: const Duration(milliseconds: 1200),
                                  dismissOnTap: true
                                );
                                 Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen(),
                                ));
                            }else if(num == 'invalid'){
                               EasyLoading.showToast('Invalid OTP',
                                   toastPosition:
                                       EasyLoadingToastPosition.center,
                                 );
                            }
                           
                          },                                                                                                                                      
                             child:  Container( 
                                    height: size.height*0.07,                                                                                                                                                                          
                                   decoration:const BoxDecoration(                                                                                                                                 
                                   color:Color.fromRGBO(39, 105, 170, 1)),
                                  alignment: Alignment.center,
                                child:                                      
                                   const Text(
                                    'Verify',
                                    style: TextStyle(
                                       color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                 textAlign: TextAlign.center,
                           ),
                      ), 
                  ),
              )

               ]
              )
          )
   );
  }
}