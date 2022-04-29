import 'package:flutter/material.dart';

import 'package:flutter_application/screens/sign_up_page.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  
  bool showPassword=true;

  String _userName = '';

  String _password = '';

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm(BuildContext context) {
   
    final bool ? isValid = _formKey.currentState ?.validate();
    if(isValid == true){
      
     Navigator.push(context, MaterialPageRoute(
      builder: (context) => HomeScreen(),
    ));
    }
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: SafeArea(        
        
        child: Container(
        
         
          padding:const EdgeInsets.only(left: 16,right: 16),
         
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 10,),
                    Text('Welcome',style: TextStyle(fontSize: 26,
                    fontWeight: FontWeight.bold),),
                    SizedBox(height: 6,),
                    Text('Sign in to continue',style: TextStyle(fontSize: 20,color: Colors.grey),)
                  ],
                ),
                
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                      
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          labelStyle:TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                            
                           
                            ),
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(
                           color:Colors.grey.shade500,
                           ),
                          ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(
                           color: Colors.grey.shade400,
                           ),
                          ),
                        ),
                        validator: (value){
                          if(value ==null || value.trim().isEmpty){
                            return 'Please enter user name';
                          }if(!RegExp(r'\S+@\S+\.com+').hasMatch(value)){
                            return 'Enter valid user name';
                          }                                                  
                          return null;
                        },
                        onChanged: (value) => _userName = value,
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                          
                        obscureText: showPassword ,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: showPassword ? const Icon(Icons.visibility_off):
                            const Icon(Icons.visibility,color: Colors.black,),
                            onPressed: () {
                              setState(() {      
                                 showPassword =  !showPassword;
                                });                                                                                                                  
                            },
                          ),
                          labelStyle:  TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                            
                            ),
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(
                           color: Colors.grey.shade500,
                           ),
                          ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(
                           color: Colors.grey.shade400,
                           ),
                          ),
                        ),
                        validator: (value){
                          if(value == null || value.trim().isEmpty){
                           return ' please enter password';
                          }
                          if(value.trim().length<8)
                          {
                            return 'Password must be at least 8 letters';
                          }
                          if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
                            return 'Please enter a valid password';
                                    
                          }
                          
                        return null;
                        },
                        
                         onChanged: (value) => _password= value,
                      ),
                      const SizedBox(height: 8,),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Forget Password ?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    const SizedBox(height: 18,),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                         
                             return _trySubmitForm(context);
                           
                                                                                                                          
                          },
                          child: Ink(decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                           gradient:const  LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors:[
                            Color(0xffff5f6d),
                             Color(0xffff5f6d),
                             Color(0xffffc371),
                            ]
                          ),
                          
                          ),
                          child: Container(                            
                            alignment: Alignment.center,
                            constraints:const BoxConstraints(
                              maxWidth: double.infinity,
                              minHeight: 50
                            ),
                          
                            child:
                             const  Text('Login',
                            style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold),
                            textAlign:TextAlign.center,),
                             
                            ),
                          ),
                           
                          style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6),),),
                          ),
                        ), 
                        ),
                    const  SizedBox(height: 10,),
                      Container(                       
                        height: 35,                    
                        width: 310,
                        color:const Color.fromARGB(255, 135, 75, 247),
                        child: TextButton(
                          onPressed: (){},                                                                 
                          child: Row(                            
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/SandMLogo.png',height: 30,width: 40,),
                             const SizedBox(width: 10,),
                             const  Text('Connect with S&M',
                              style: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                            ],                      
                          ),
                      ),
                      ),
                     
                    ],
                  ),
                ),
                Padding(
                      padding:const EdgeInsets.only(bottom:4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const Text('Dont have a account', style: TextStyle(fontWeight: FontWeight.bold),),
                         const SizedBox(width: 8,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return SignUpPage();
                              }));
                            },
                            
                            child:const Text('SignUP Now.', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo),),
                          ) 
                        ],
                      ),
                    )
              ], 
            ),
          ),
        ),
      
    );
  }
}

