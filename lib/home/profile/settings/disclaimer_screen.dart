import 'package:flutter/material.dart';

import '../../../utils/screen.dart';
import '../widgets/app_bar.dart';

class DisclaimerScreen extends StatefulWidget {
  const DisclaimerScreen({super.key});

  @override
  State<DisclaimerScreen> createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Screen(
        child: Scaffold(
      body: Column(
        children: const [
          CustomAppBar(
            title: "Disclaimer",
          ),
        ],
      ),
    ));
  }

  Widget textSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: const [Text("")],
      ),
    );
  }
}


// 02:50
// * A 5.00 V 46 100% 4
// Disclaimer
// The Blue Cold application remains the
// property of Blue Cold Refrigeration Pvt. Ltd.
// and is provided to our customers for making
// their work easy and quick. This software is
// recommended only for technically qualified
// users for rough calculations and final
// verifications. This does not replace specialist
// knowledge or experience when calculating
// heat load and selecting products.
// This program is very accurate, however we
// do not guarantee the result because of widely
// variable application, and data that can be
// misinterpreted between parties during initial
// project evaluation. We have used
// assumptions and approximations to make the
// app look simple and user friendly. Therefore
// the use of the programs is at user's risk and
// Blue Cold is not responsible for the same. All
// data provided in this app is for specific
// products and applications, and is subject to
// change without prior notice. It is strictly
// forbidden to use or share any data other than
// the downloadable files in this app with any
// third party, without any written permission
// from Blue Cold Refrigeration Pvt. Ltd.
// We will continuously update and improve this
// software from time to time.
// Our customer's comments and their valuable
// feedback would assist us to enhance the use
// of this application, and would be greatly
// appreciated.