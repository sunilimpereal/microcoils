import 'package:flutter/material.dart';
import 'package:microcoils/utils/constants/image_constaants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _logo(),
          text(),
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(ImageConstants.logo),
        fit: BoxFit.contain,
      )),
    );
  }

  Widget text() {
    return Container(
      child: Column(
        children: const [
          Text(
            "Placeholder text to add phrase about the company",
            style: TextStyle(),
          )
        ],
      ),
    );
  }
}
