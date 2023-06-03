import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:microcoils/theme/theme1.dart';
import 'package:microcoils/utils/ApiUrls.dart';

import 'authentication/screens/login.dart';
import 'home/calculator/blast room calculator/data/sharedpref_bastroom.dart';
import 'home/calculator/cold room calculator/data/sharedpref_coldroom.dart';
import 'home/screen/home_navigation.dart';
import 'utils/shared_preferences.dart';

late FirebaseAuth firebaseAuth;
ApiUrls urls = ApiUrls();
SharedPref sharedPref = SharedPref();
SharedPrefColdRoom sharedPrefColdRoom = SharedPrefColdRoom();
SharedPrefBlastRoom sharedPrefBlastRoom = SharedPrefBlastRoom();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await sharedPref.init();
  await sharedPrefColdRoom.init();
  await sharedPrefBlastRoom.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Micocoils',
      theme: theme1,
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? const LoginScreen() : const HomeNavigation(),
    );
  }
}
