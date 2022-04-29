import 'package:flutter/material.dart';
import 'package:flutter_application/screens/home_screen.dart';
import 'package:flutter_application/screens/login_screen.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword=true;
  String _userEmail = '';

  String _userName = '';

  String _password = '';



  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm(BuildContext context) {
    final bool? isValid = _formKey.currentState?.validate();
    if(isValid == true){
      Navigator.push(context, MaterialPageRoute(
      builder: (context) => HomeScreen(),
      
    ));
    }
   
  }

 @override
 SignUpPage createState() => SignUpPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
       resizeToAvoidBottomInset: false,
           body: SafeArea(
             child: Container(
              
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Column(                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const[
                       SizedBox(height: 4,),
                      Text('Create Account',style: TextStyle(fontSize: 26,
                      fontWeight: FontWeight.bold),),
                       SizedBox(height: 6,),
                      Text('Sign up to get started',style: TextStyle(fontSize: 20,color: Colors.grey,),)
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
               children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle:  TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w600,
                          ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                         color: Colors.grey.shade400,
                         ),
                        ),
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide:BorderSide(
                         color: Colors.grey.shade400,
                         ),
                       ),
                         floatingLabelBehavior : FloatingLabelBehavior.auto,
                        ),
                        validator: (value){
                          if(value== null ||  value.trim().isEmpty){
                            return 'Enter your Name';
                          }if(value.trim().length<4){
                            return 'Full name must be at least 4 charcters';
                          }
                          return null;
                        },
                        onChanged: (value) => _userName=value,
                      ),
                      const SizedBox(height: 6,),
                      TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email ID',
                        labelStyle:  TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w600,
                          ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                         color: Colors.grey.shade400,
                         ),
                        ),
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide:BorderSide(
                         color: Colors.grey.shade400,
                         ),
                       ),
                         floatingLabelBehavior : FloatingLabelBehavior.auto,
                        ),
                        validator: (value){
                          if(value== null || value.trim().isEmpty){
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'\S+@\S+\.com+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                           return null;
                        },
                        onChanged: (value) => _userEmail = value,
                      ),
                     const SizedBox(height: 6,),
                      TextFormField(
                        obscureText: showPassword,
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
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w600,
                          ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                         color: Colors.grey.shade400,
                         ),
                        ),
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                         color: Colors.grey.shade400,
                         ),
                       ),
                         floatingLabelBehavior : FloatingLabelBehavior.auto,
                        ),
                        validator: (value) {
                          
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 8) {

                            return 'Password must be at least 8 characters in length';
                          }
                          if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
                            return 'Please enter a valid password,\n'
                                    '* At least one number,\n'
                                    '* At least one uppercase,\n'
                                    '* At least one lowercase.\n'
                                    '* At least one specialn character';
                          }
                          
                         
                          return null;
                        },
                        onChanged: (value) => _password = value,
                      
                      ),
                    const SizedBox(height: 6,),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        onPressed:() {
                         
                             return _trySubmitForm(context);
                           
                                                                                                                          
                          },
                         style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6),),),
                        ),
                        child: Ink(decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                         gradient:const  LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors:[
                          Color(0xffff5f6d),
                           Color(0xffff5f6d),
                           Color(0xffffc371),
                          ],
                        ),
                        
                         
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          
                          constraints:const BoxConstraints(
                            maxWidth: double.infinity,
                            minHeight: 50
                          ),
                          
                          child: const Text('Sign UP',
                          style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold),
                          textAlign:TextAlign.center,
                          ),
                        ),  
                        ),
                          ),
                    ),
                    const SizedBox(height: 4,),
                    Container(
                      height: 30,
                      width: 350,
                      color: Colors.indigo[100],
                      child: TextButton(
                        onPressed: (){},
                        style: OutlinedButton.styleFrom(
                          
                        shape :RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),                       
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/SandMLogo.png',height: 20,width: 30,),
                          const  SizedBox(width: 10,),
                           const Text('Signup with S&M',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ],                      
                        ),
                    ),
                    ),
                                  const SizedBox(height: 4,),
                                  ],                                          
                                ),
                  ),
              Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Row(
                    
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const  Text('I am already a member',style: TextStyle(fontWeight: FontWeight.bold), ),
                       const  SizedBox(width: 8,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);                                                          
                          },
                          
                          child:
                           const Text('Login',  style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.indigo),
                             ),
                        ) 
                      ],
                    ),
                  )
            
                ]
             ),   
    ),
    
                  ),
    );
  
  }
}