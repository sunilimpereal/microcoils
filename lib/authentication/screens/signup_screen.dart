import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:microcoils/authentication/screens/widgets/input_field.dart';
import 'package:microcoils/authentication/screens/widgets/login_top_section.dart';
import 'package:microcoils/authentication/screens/widgets/social_login_button.dart';

import '../../home/screen/home_screen.dart';
import '../../home/splash_screen.dart';
import '../../utils/shared_preferences.dart';
import '../data/models/login_request_model.dart';
import '../data/repository/auth_repository.dart';
import 'otp_verification.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVerfyNumber = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          // padding: EdgeInsets.all(8),
          child: Stack(
            children: [
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(1),
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    inputSection(context),
                  ],
                ),
              ),
              ClipPath(
                clipper: MyCustomClipperTop(),
                child: Container(
                  width: 250,
                  height: 200,
                  color: Colors.red,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: ClipPath(
                  clipper: MyCustomClipperBottom(),
                  child: Container(
                    width: 250,
                    height: 100,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppInputField(
              label: "Name",
              onSubmitted: (value) {},
              textEditingController: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },
            ),
            AppInputField(
              label: "Mobile",
              textEditingController: _numberController,
              onSubmitted: (value) {},
              onChanged: (v) {
                setState(() {
                  isVerfyNumber = false;
                });
              },
              textInputType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter phone number';
                }
                if (value.length < 10) {
                  return 'Please enter a valid phone number';
                }

                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            signupButton(),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 0.5,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text("Or Sign up with"),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 0.5,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        googleSignIn(),
                        facebookSignIn(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget signupButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            AuthRepository()
                .loginWithNumber(
                    LoginRequest(socialId: _numberController.text, contact: _numberController.text, name: _nameController.text, email: ""))
                .then((value) {
              if (value!.otp == 0) {
                setState(() {
                  isVerfyNumber = true;
                });
                return;
              }
              sharedPrefs.setUserDetails(
                id: value.user.id.toString(),
                email: value.user.email ?? '',
                name: value.user.name,
                number: value.user.contact,
                address: value.user.address ?? '',
                company: value.user.companyName ?? '',
                photoUrl: value.user.imageUrl ?? '',
              );
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => OtpVerificationScreen(
                        otp: value.otp.toString(),
                      )));
            });
          }
        },
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                !isVerfyNumber ? "Sign Up" : "Verify Number",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_right_rounded,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget googleSignIn() {
    return SocialLoginButton(
      name: "Google",
      onpressed: () {
        AuthRepository().signInWithGoogle().then((user) {
          sharedPrefs.setUserDetails(
            id: user.user?.uid ?? '',
            email: user.user?.email ?? '',
            name: user.user?.displayName ?? '',
            number: user.user?.phoneNumber ?? '',
            address: '',
            company: '',
            photoUrl: user.user?.photoURL ?? '',
          );

          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const HomeScreen()));
        });
      },
      image: "assets/images/google_logo.png",
    );
  }

  Widget facebookSignIn() {
    return SocialLoginButton(
      name: "Facebook",
      onpressed: () {},
      image: "assets/images/facebook_logo.png",
    );
  }

  Widget loginTest() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an account?"),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SignUpScreen();
              }));
            },
            child: const Text(
              "Log In",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
