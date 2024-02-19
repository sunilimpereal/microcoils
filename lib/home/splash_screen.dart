import 'package:flutter/material.dart';
import 'package:microcoils/home/screen/home_screen.dart';
import 'package:microcoils/utils/constants/image_constaants.dart';

import '../authentication/screens/login.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  int splashtime = 2;
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
          //pushReplacement = replacing the route so that
          //splash screen won't show on back button press
          //navigation to Home page.
          builder: (context) {
        return sharedPref.loggedIn ? const HomeScreen() : const LoginScreen();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/logo.png"))),
              ),
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
          Positioned(
            top: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              decoration:
                  BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstants.logo_old))),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipperTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset(50, size.height - 100);
    var controlPoint2 = Offset(size.width - 50, size.height);

    Path path = Path()
      ..lineTo(0, size.height)
      ..cubicTo(
          controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy, size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyCustomClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset(50, size.height - 70);
    var controlPoint2 = Offset(size.width - 50, size.height);

    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..cubicTo(
          controlPoint2.dx, controlPoint2.dy, controlPoint1.dx, controlPoint1.dy, 0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
