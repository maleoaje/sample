import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample/auth/sign_in.dart';
import 'package:sample/config/constants.dart';
import 'package:sample/config/global_style.dart';
import 'package:sample/homepage.dart';
import 'package:sample/services/network_handler.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final storage = const FlutterSecureStorage();
  NetworkHandler networkHandler = NetworkHandler();
  bool validate = false;
  bool circular = false;
  String fcmToken = '';
  final _globalkey = GlobalKey<FormState>();
  String errorText = '';
  final TextEditingController _etEmail = TextEditingController();
  final TextEditingController _etPassword = TextEditingController();
  final TextEditingController _etConfirmPassword = TextEditingController();
  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;
  bool _obscureText1 = true;
  IconData _iconVisible1 = Icons.visibility_off;
  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

  void _toggleObscureText1() {
    setState(() {
      _obscureText1 = !_obscureText1;
      if (_obscureText1 == true) {
        _iconVisible1 = Icons.visibility_off;
      } else {
        _iconVisible1 = Icons.visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                    color: white, fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                    blurStyle: BlurStyle.solid,
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Form(
                key: _globalkey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: 50,
                        ),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) return "Enter Email";
                        if (!value.contains('@')) return "Email is invalid";
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      cursorColor: white,
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: white),
                      keyboardType: TextInputType.emailAddress,
                      controller: _etEmail,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        focusColor: primaryPurpl,
                        fillColor: primaryPurpl,
                        hoverColor: primaryPurpl,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            borderSide: BorderSide(color: white, width: 0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            borderSide: BorderSide(color: white, width: 0)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      obscureText: _obscureText,
                      validator: (value) {
                        if (value!.isEmpty) return "Enter Password";
                        if (value.length < 6) return "Password too short";
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      cursorColor: white,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      controller: _etPassword,
                      style: const TextStyle(color: white),
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: primaryPurpl,
                        fillColor: primaryPurpl,
                        hoverColor: primaryPurpl,
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            borderSide: BorderSide(color: white, width: 0)),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            borderSide: BorderSide(color: white, width: 0)),
                        suffixIcon: IconButton(
                            icon: Icon(_iconVisible,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                size: 20),
                            onPressed: () {
                              _toggleObscureText();
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: _obscureText,
                      validator: (value) {
                        if (value!.isEmpty) return "Passwords don't match";
                        if (_etPassword.text != _etConfirmPassword.text) {
                          return "Passwords don't match";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      cursorColor: white,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      controller: _etConfirmPassword,
                      style: const TextStyle(color: white),
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: primaryPurpl,
                        fillColor: primaryPurpl,
                        hoverColor: primaryPurpl,
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            borderSide: BorderSide(color: white, width: 0)),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            borderSide: BorderSide(color: white, width: 0)),
                        suffixIcon: IconButton(
                            icon: Icon(_iconVisible1,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                size: 20),
                            onPressed: () {
                              _toggleObscureText1();
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(1),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) => primaryColor,
                        ),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                      ),
                      onPressed: () async {
                        setState(() {
                          circular = true;
                          errorText = '';
                        });

                        if (_globalkey.currentState!.validate()) {
                          Map<String, String> data = {
                            "email": _etEmail.text,
                            "password": _etPassword.text,
                          };
                          log(data.toString());
                          var response =
                              await networkHandler.post('/register', data);
                          if (response == 'No Internet') {
                            setState(() {
                              circular = false;
                              errorText = 'Check your internet connection';
                            });
                          } else if (response == 'Timeout') {
                            setState(() {
                              circular = false;
                              errorText = 'Network Timeout, try again';
                            });
                          } else if (response == 'Unknown error') {
                            setState(() {
                              circular = false;
                              errorText = 'Unknown Error';
                            });
                          }

                          Map<String, dynamic> output =
                              json.decode(response.body);
                          log('response body: $output');
                          if (response == 'No Internet') {
                            setState(() {
                              circular = false;
                              errorText = 'No Internet';
                            });
                          } else if (response.statusCode == 200 ||
                              response.statusCode == 201) {
                            setState(() {
                              circular = false;
                            });
                            Fluttertoast.showToast(
                                backgroundColor: primaryColor,
                                msg: 'Regristration Successful ',
                                toastLength: Toast.LENGTH_LONG);
                            Navigator.pop(context);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                          email: _etEmail.text,
                                        )),
                                (Route<dynamic> route) => false);
                          } else {
                            if (response.statusCode != 200 ||
                                response.statusCode != 201) {
                              setState(() {
                                circular = false;
                                errorText = output['message'];

                                Fluttertoast.showToast(
                                    backgroundColor: primaryRed,
                                    msg: output['error'],
                                    toastLength: Toast.LENGTH_LONG);
                              });
                            } else {
                              setState(() {
                                circular = false;
                              });
                            }
                          }
                        }
                        setState(() {
                          circular = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            circular
                                ? const SpinKitThreeBounce(
                                    color: white,
                                    size: 20,
                                  )
                                : const Text(
                                    'Sign Up',
                                    style: GlobalStyle.darkButtonStyle,
                                    textAlign: TextAlign.center,
                                  ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text("or sign up with ",
                          style: GlobalStyle.boldStyle),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: const Image(
                              image: AssetImage("assets/google.png"),
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: GlobalStyle.normalStyle,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    },
                    child: const Text(
                      ' Log in',
                      style: GlobalStyle.subTitleStyle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Mock login details: ",
                    style: GlobalStyle.normalStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: const [
                Text(
                  ' email: eve.holt@reqres.in',
                  style: GlobalStyle.subTitleStyle,
                ),
                Text(
                  ' password: pistol',
                  style: GlobalStyle.subTitleStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: TextButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(1),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) => white,
                  ),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
                ),
                onPressed: () {
                  setState(() {
                    _etEmail.text = "eve.holt@reqres.in";
                    _etPassword.text = "pistol";
                    _etConfirmPassword.text = "pistol";
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Use mockup',
                      style: GlobalStyle.lightButtonStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
