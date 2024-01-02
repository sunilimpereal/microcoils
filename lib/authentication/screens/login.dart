import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microcoils/authentication/bloc/login_bloc.dart';
import 'package:microcoils/authentication/screens/signup_screen.dart';
import 'package:microcoils/authentication/screens/widgets/input_field.dart';
import 'package:microcoils/authentication/screens/widgets/login_top_section.dart';
import 'package:microcoils/authentication/screens/widgets/social_login_button.dart';
import 'package:microcoils/home/screen/home_screen.dart';
import '../../common/error_popup.dart';
import '../../home/splash_screen.dart';
import '../../utils/shared_preferences.dart';
import '../data/repository/auth_repository.dart';
import 'otp_verification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVerfyNumber = false;
  bool loading = false;

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
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
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
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppInputField(
                  label: "Email",
                  onSubmitted: (value) {},
                  textEditingController: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    // Regular expression for a valid email address
                    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    context.read<LoginBloc>().add(LoginChangedEvent(email: value));
                  },
                ),
                AppInputField(
                  label: "Password",
                  textEditingController: _passwordController,
                  isPassword: true,
                  onSubmitted: (value) {},
                  onChanged: (value) {
                    context.read<LoginBloc>().add(LoginChangedEvent(password: value));
                  },
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
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
                          padding: EdgeInsets.all(8),
                          height: 0.5,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text("Or login with"),
                        const SizedBox(
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
      },
    );
  }

  Widget signupButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(),
            onPressed: () {
              setState(() {
                loading = true;
              });
              if (_formKey.currentState!.validate()) {
                AuthRepository()
                    .loginWithEmailPassword(email: state.email, password: state.password)
                    .then((value) {
                  // log(loginResponseToJson(value!));
                  if (value != null) {
                    if (value.otp != null) {
                      setState(() {
                        loading = false;
                      });
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => OtpVerificationScreen(
                          otp: value.otp.toString(),
                          email: _emailController.text,
                        ),
                      ));

                      return;
                    }
                    sharedPrefs.setUserDetails(
                      id: value?.user?.id.toString() ?? '',
                      email: value?.user?.email ?? '',
                      name: value?.user?.name ?? '',
                      number: value?.user?.contact ?? '',
                      address: value?.user?.address ?? '',
                      company: value?.user?.companyName ?? '',
                      photoUrl: value?.user?.imageUrl ?? '',
                    );
                    setState(() {
                      loading = false;
                    });
                    sharedPrefs.setLoggedIn();
                    Navigator.of(context).pushAndRemoveUntil(
                      CupertinoPageRoute(builder: (context) => const HomeScreen()),
                      ModalRoute.withName('/'),
                    );
                  } else {
                    setState(() {
                      loading = false;
                    });
                    showErrorPopup(context, 'Login failed. Please check your credentials.');
                  }
                });
              }
            },
            child: SizedBox(
              child: loading
                  ? Container(
                      width: 20,
                      height: 30,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                    )
                  : Row(
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
      },
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
          const Text("Do not have an account?"),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SignUpScreen();
              }));
            },
            child: const Text(
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
