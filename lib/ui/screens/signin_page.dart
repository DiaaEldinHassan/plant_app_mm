import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding/ui/screens/signup_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';



import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';

import '../../constants.dart';
import '../../models/authentication_button.dart';
import '../../models/show_snack_bar.dart';

import '../root_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool rememberMe = false;
  String Email = '';
  String password = '';
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Material(
        child: Form(
          key: formKey,
          child: Stack(
            alignment: Alignment.bottomRight,
            fit: StackFit.expand,
            children: [
              // First Child in the stack

              Image.asset(
                'assets/images/in-ground-lawn-sprinklers.jpg',
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),

              Positioned(
                top: 30.0,
                left: 20.0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.0,
                  child: IconButton(
                    onPressed: () {
                      exit(0);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: kDarkGreenColor,
                      size: 24.0,
                    ),
                  ),
                ),
              ),

              // Second Child in the stack
              Positioned(
                height: MediaQuery.of(context).size.height * 0.67,
                width: MediaQuery.of(context).size.width,
                child: Scaffold(
                  body: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.67,
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // First Column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome Back',
                                style: GoogleFonts.poppins(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGreenColor,
                                ),
                              ),
                              Text(
                                'Login to your account',
                                style: GoogleFonts.poppins(
                                  color: kGreyColor,
                                  fontSize: 15.0,
                                ),
                              )
                            ],
                          ),

                          // Second Column
                          Column(
                            children: [
                              CustomTextField(
                                hintText: 'Email',
                                icon: Icons.email,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  Email = value;
                                },
                              ),
                              CustomTextField(
                                hintText: 'Password',
                                icon: Icons.lock,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                onChanged: (value) {
                                  password = value != '' ? value : '';
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.white,
                                          fillColor: MaterialStateProperty.all(
                                              kDarkGreenColor),
                                          value: rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              rememberMe = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Remember Me',
                                          style: TextStyle(
                                            color: kGreyColor,
                                            fontSize: 14.0,
                                          ),
                                        )
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                kDarkGreenColor),
                                      ),
                                      child: const Text(
                                        'Forgot Password ?',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Third Column
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              bottom: 20.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                AuthenticationButton(
                                    label: 'Log In',
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        isloading = true;

                                        setState(() {});

                                        try {
                                          await LoginUser();
                                          showSnackBar(context, 'Welcome');
                                         Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: const RootPage(),
                                    type: PageTransitionType.bottomToTop));
                                          isloading = false;
                                          setState(() {});
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'user-not-found') {
                                            showSnackBar(context,
                                                'No user found for that email.');
                                          } else if (e.code ==
                                              'wrong-password') {
                                            showSnackBar(context,
                                                'Wrong password provided for that user.');
                                          }
                                        }
                                        isloading = false;
                                        setState(() {});
                                      }
                                    }),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Don\'t have an account ?',
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  kDarkGreenColor),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignupScreen()));
                                        },
                                        child: const Text(
                                          'Sign up',
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> LoginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: Email, password: password);
  }
}
