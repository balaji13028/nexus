import 'package:flutter/material.dart';
import 'package:flutter_application/models/user_details_model.dart';
import 'package:flutter_application/screens/sign_up_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../api_url.dart';
import '../models/visitor_details_model.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _pwdcontroller = TextEditingController();

  bool showPassword = true;

  String _userName = '';

  String _password = '';

  @override
  void initState() {
    

    super.initState();
  }

  @override
  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm(BuildContext context) {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    }
  }

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 170, 1),
              ],
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topCenter)),
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Welcome',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Sign in to continue',
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade50),
                    )
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _namecontroller,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                          ),
                          prefixIcon: const Icon(Icons.mail_outline,
                              color: Colors.white54),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter user name';
                          }
                          //if(!RegExp(r'\S+@\S+\.com+').hasMatch(value)){
                          //     return 'Enter valid user name';
                          //   }
                          return null;
                        },
                        onChanged: (value) => _userName = value,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _pwdcontroller,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.white),
                        obscureText: showPassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: showPassword
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.white38,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  ),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                          ),
                          prefixIcon: const Icon(
                            Icons.key_sharp,
                            color: Colors.white54,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return ' please enter password';
                          }
                          //   if(value.trim().length<8)
                          //   {
                          //     return 'Password must be at least 8 letters';
                          //   }
                          //   if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
                          //     return 'Please enter a valid password';

                          return null;
                        },
                        onChanged: (value) => _password = value,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Forget Password ?',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () async {
                            flatResponse();
                          
                             Navigator.push(
                                     context,
                                    MaterialPageRoute(
                                       builder: (context) => HomeScreen(),
                                   ));
                          },
                            
                          //   String stat = await userLogin(
                          //       _namecontroller.text, _pwdcontroller.text);

                          //   if (stat == '1') {
                              
                          //     final bool? isValid = _formKey.currentState?.validate();
                          //         configLoading(stat);
                          //     if (isValid == true) {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) => HomeScreen(),
                          //           ));
                          //     }
                          //   } else if (stat == '2') {
                          //     final bool? isValid =_formKey.currentState?.validate();
                          //     EasyLoading.showToast('Incorrect password',
                          //         toastPosition:
                          //             EasyLoadingToastPosition.bottom,
                          //       );
                          //   }else if(stat == '3'){
                          //      final bool? isValid = _formKey.currentState?.validate();
                          //         _showToast(stat);
                          //   }
                          //   flatResponse();
                          //   //usersResponse();
                          // //  noticesResponse();
                          //  //visiorsResponse();
                            
                          // },
                          child: Ink(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.indigo.shade500),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: const BoxConstraints(
                                  maxWidth: double.infinity, minHeight: 40),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 130,
                                child: const Divider(
                                  color: Colors.white54,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(21.5),
                                child: Text(
                                  'or',
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 50,
                                width: 130,
                                child: const Divider(
                                  color: Colors.white54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 310,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color.fromRGBO(213, 76, 63, 1)),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google.png',
                                height: 40,
                                width: 50,
                              ),
                              const Text(
                                'Login with Google',
                                style: TextStyle(
                                  color: Colors.white70,
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
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white38),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpPage();
                          }));
                        },
                        child: const Text(
                          'Signup Now!',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
