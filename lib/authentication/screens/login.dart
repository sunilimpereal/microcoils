import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:microcoils/authentication/screens/widgets/input_field.dart';
import 'package:microcoils/authentication/screens/widgets/login_top_section.dart';
import 'package:microcoils/authentication/screens/widgets/social_login_button.dart';

import '../../home/screen/home_navigation.dart';
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
      body: KeyboardDismissOnTap(
        child: Center(
          child: Column(
            children: [
              const LoginTopSection(),
              inputSection(context),
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
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        googleSignIn(),
                        facebookSignIn(),
                      ],
                    ),
                  ),
                  signupButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget signupButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 14,
          ),
          shape: const StadiumBorder(),
          elevation: 3,
          shadowColor: Colors.lightBlue.shade100,
        ),
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
          width: MediaQuery.of(context).size.width * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                !isVerfyNumber ? "Login" : "Verify Number",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 8,
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

          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const HomeNavigation()));
        });
      },
      image: "assets/images/google_logo.png",
    );
  }

  Widget facebookSignIn() {
    return SocialLoginButton(
      onpressed: () {},
      image: "assets/images/facebook_logo.png",
    );
  }
}
