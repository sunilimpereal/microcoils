import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:microcoils/authentication/screens/signup_screen.dart';
import 'package:microcoils/authentication/screens/widgets/input_field.dart';
import 'package:microcoils/authentication/screens/widgets/login_top_section.dart';
import 'package:microcoils/authentication/screens/widgets/social_login_button.dart';
import 'package:microcoils/home/screen/home_screen.dart';

import '../../home/screen/home_navigation.dart';
import '../../home/splash_screen.dart';
import '../../utils/shared_preferences.dart';
import '../data/models/login_request_model.dart';
import '../data/repository/auth_repository.dart';
import 'otp_verification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVerfyNumber = false;

  @override
  void initState() {
    super.initState();
  }

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
              // Positioned(
              //   top: 0,
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height * 0.45,
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         image: DecorationImage(image: const AssetImage("assets/images/login_bg.png"), fit: BoxFit.fitWidth, opacity: 01)),
              //   ),
              // ),
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    const LoginTopSection(),
                    inputSection(context),
                    signupText(),
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
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Or login with"),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Colors.grey,
                    ),
                  ],
                )),
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
                !isVerfyNumber ? "Login" : "Verify Number",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.keyboard_arrow_right_rounded)
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

  Widget signupText() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Do not have an account?"),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SignUpScreen();
              }));
            },
            child: Text(
              "Sign Up",
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
