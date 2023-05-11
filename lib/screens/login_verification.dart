import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/api_url.dart';
import 'package:flutter_application/admin_module/admin_homepage.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_application/tenent_module/tenent_homepage.dart';
import 'package:flutter_application/watchman_module/homepage_wm.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../owner_module/owner_homepage.dart';

class LoginVerify extends StatefulWidget {
  final String number;

  const LoginVerify({Key? key, required this.number}) : super(key: key);

  @override
  State<LoginVerify> createState() => _LoginVerifyState();
}

class _LoginVerifyState extends State<LoginVerify> {
  String num1 = '';

  String num2 = '';

  String num3 = '';

  String num4 = '';

  String num5 = '';

  bool _isLoaderVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GlobalLoaderOverlay(
        child: Scaffold(
          //resizeToAvoidBottomInset: false,

          body: Container(
            padding: const EdgeInsets.only(top: 30),
            child: Stack(children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 45),
                  child: Text(
                    'Enter the 5 digit OTP sent to' ' ${widget.number}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.054,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 75),
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
                                      color: Colors.grey, width: 1.8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.8),
                                ),
                              ),
                              onChanged: ((value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                                num1 = value;
                              }),
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
                                      color: Colors.grey, width: 1.8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.8),
                                ),
                              ),
                              onChanged: ((value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                                num2 = value;
                              }),
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
                                      color: Colors.grey, width: 1.8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.8),
                                ),
                              ),
                              onChanged: ((value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                                num3 = value;
                              }),
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
                                      color: Colors.grey, width: 1.8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.8),
                                ),
                              ),
                              onChanged: ((value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                                num4 = value;
                              }),
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
                                      color: Colors.grey, width: 1.8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.8),
                                ),
                              ),
                              onChanged: ((value) {
                                num5 = value;
                              }),
                            ),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 14.0, right: size.width * 0.58),
                  child: TextButton(
                      onPressed: () async {
                        String num = await userLogin(widget.number);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 15),
                        height: size.height * 0.048,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          //color:const Color.fromRGBO(39, 105, 170, 1)
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Resend OTP',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ]),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                  ),
                  onPressed: () async {
                    String num = await Verifyapi(
                        num1, num2, num3, num4, num5, widget.number);
                    String role = await userRoleApi(widget.number);
                    setState(() {
                      _isLoaderVisible = true;
                    });
                    if (num == 'valid' && role == 'WM') {
                      loader();
                      await usersResponse(widget.number);
                      await visitorsResponse();
                      await flatResponse();
                      EasyLoading.showSuccess("Successfully login",
                          duration: const Duration(milliseconds: 1500),
                          dismissOnTap: true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageWM(),
                          ));
                    } else if (num == 'valid' && role == 'A') {
                      loader();
                      await usersResponse(widget.number);
                      await visitorsResponse();
                      await flatResponse();
                      await noticesResponse();
                      EasyLoading.showSuccess("Successfully login",
                          duration: const Duration(milliseconds: 1200),
                          dismissOnTap: true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminHomepage(),
                          ));
                    } else if (num == 'valid' && role == 'SA') {
                      EasyLoading.showSuccess("Successfully login",
                          duration: const Duration(milliseconds: 1200),
                          dismissOnTap: true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminHomepage(),
                          ));
                    } else if (num == 'valid' && role == 'TN') {
                      loader();
                      await usersResponse(widget.number);
                      await visitorsResponse();
                      EasyLoading.showSuccess("Successfully login",
                          duration: const Duration(milliseconds: 1200),
                          dismissOnTap: true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomepageTN(),
                          ));
                    } else if (num == 'valid' && role == 'OW') {
                      loader();
                      await usersResponse(widget.number);
                      await visitorsResponse();
                      await flatResponse();
                      EasyLoading.showSuccess("Successfully login",
                          duration: const Duration(milliseconds: 1200),
                          dismissOnTap: true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomepageOW(),
                          ));
                    } else if (num == 'invalid') {
                      EasyLoading.showToast(
                        'Invalid OTP',
                        toastPosition: EasyLoadingToastPosition.center,
                      );
                    }
                    setState(() {
                      _isLoaderVisible = false;
                    });
                  },
                  child: Container(
                    height: size.height * 0.065,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: const Color.fromRGBO(39, 105, 170, 1)),
                    alignment: Alignment.center,
                    child: const Text(
                      'Verify',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          letterSpacing: 0.9,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  loader() async {
    if (_isLoaderVisible) {
      context.loaderOverlay.show();
    } else {
      context.loaderOverlay.hide();
    }
  }
}
