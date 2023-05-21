import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../constants.dart';
import '../../models/authentication_button.dart';
import '../../models/show_snack_bar.dart';


class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  static String id = 'SignupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

   String ?fullname, email, password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Material(
        child: Stack(
          children: [
            Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.9,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Register',
                                style: GoogleFonts.poppins(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGreenColor,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                'Create a new account',
                                style: GoogleFonts.poppins(
                                  color: kGreyColor,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 40.0),
                              CustomTextField(
                                hintText: 'Full Name',
                                icon: Icons.person,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  fullname = value;
                                },
                              ),
                              CustomTextField(
                                hintText: 'Email',
                                icon: Icons.mail,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  email = value;
                                },
                              ),
                              CustomTextField(
                                hintText: 'Password',
                                icon: Icons.lock,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  password = value;
                                },
                              ),
                              /* CustomTextField(
                                hintText: 'Confirm Password',
                                icon: Icons.lock,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {},
                              ),*/
                              const SizedBox(height: 15.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'By signing you agree to our ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: kDarkGreenColor,
                                    ),
                                  ),
                                  Text(
                                    ' Terms of use',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: kGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'and ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: kDarkGreenColor,
                                    ),
                                  ),
                                  Text(
                                    ' privacy notice',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: kGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: AuthenticationButton(
                              label: 'Sign Up',
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  isLoading = true;
                                  setState(() {});
                                  try {
                                    await registerUser();
                                    
                                    showSnackBar(context, 'Email registered');
                                  
                                    isLoading = false;
                                  } on FirebaseAuthException catch (ex) {
                                    if (ex.code == 'weak-password') {
                                      showSnackBar(context, 'weak password');
                                    } else if (ex.code ==
                                        'email-already-in-use') {
                                      showSnackBar(
                                          context, 'email already exists');
                                    }
                                  } catch (ex) {
                                    showSnackBar(context, 'there was an error');
                                  }
                              
                                }
                                isLoading = false;
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30.0,
              left: 20.0,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 20.0,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: kDarkGreenColor,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential userr = await db.createUserWithEmailAndPassword(
        email: email!, password: password!);

    /* FirebaseAuth.instance
        .sendSignInLinkToEmail(
            email: UserInformation.email!, actionCodeSettings: acs)
        .catchError((onError) {
      showSnackBar(context, 'Error sending email verification $onError');
    }).then((value) {
      showSnackBar(context, 'Successfully sent email verification');
    });
    var Currentuser = FirebaseAuth.instance.currentUser;
        await Currentuser?.reload();*/
  }
}
