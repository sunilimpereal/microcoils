import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../home/profile/widgets/app_bar.dart';
import '../../home/screen/home_navigation.dart';
import '../../utils/screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String otp;
  const OtpVerificationScreen({
    super.key,
    required this.otp,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();

  FocusNode focus1 = FocusNode();
  FocusNode focus2 = FocusNode();
  FocusNode focus3 = FocusNode();
  FocusNode focus4 = FocusNode();
  FocusNode focus5 = FocusNode();
  FocusNode focus6 = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  int curIndex = 1;
  onChanged(int index) {
    setState(() {
      curIndex = index;
    });
  }

  delete() {
    deletevalue(FocusNode node, TextEditingController controller) {
      node.requestFocus();
      controller.clear();
      setState(() {
        curIndex = curIndex - 1;
      });
    }

    switch (curIndex - 1) {
      case 1:
        deletevalue(focus1, otp1);
        break;
      case 2:
        deletevalue(focus2, otp2);
        break;
      case 3:
        deletevalue(focus3, otp3);
        break;
      case 4:
        deletevalue(focus4, otp4);
        break;
      case 5:
        deletevalue(focus5, otp5);
        break;
      case 6:
        deletevalue(focus6, otp6);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(title: ""),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Verification",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Enter 6 digits verification code sent to your number",
                    style: TextStyle(),
                  )
                ],
              ),
            ),
            RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: (event) {
                if (event.isKeyPressed(LogicalKeyboardKey.backspace)) {
                  delete();
                }
              },
              child: Form(
                child: Row(
                  children: [
                    otpField(
                      focus: focus1,
                      i: 1,
                      onChanged: onChanged,
                      otpNumberController: otp1,
                      isFirst: true,
                    ),
                    otpField(
                      i: 2,
                      focus: focus2,
                      onChanged: onChanged,
                      otpNumberController: otp2,
                    ),
                    otpField(
                      i: 3,
                      focus: focus3,
                      onChanged: onChanged,
                      otpNumberController: otp3,
                    ),
                    otpField(
                      i: 4,
                      focus: focus4,
                      onChanged: onChanged,
                      otpNumberController: otp4,
                    ),
                    otpField(
                      i: 5,
                      focus: focus5,
                      onChanged: onChanged,
                      otpNumberController: otp5,
                    ),
                    otpField(
                      i: 6,
                      focus: focus6,
                      onChanged: onChanged,
                      otpNumberController: otp6,
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget otpField(
      {required TextEditingController otpNumberController,
      bool isFirst = false,
      bool isLast = false,
      required int i,
      required FocusNode focus,
      required Function(int) onChanged}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.width * 0.12,
          width: MediaQuery.of(context).size.width * 0.12,
          child: Center(
            child: TextFormField(
              style: Theme.of(context).textTheme.headline6,
              controller: otpNumberController,
              autofocus: isFirst,
              keyboardType: TextInputType.number,
              showCursor: false,
              focusNode: focus,
              textAlign: TextAlign.center,
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  onChanged(i + 1);
                  if (isLast) {
                    _validate();
                  }
                }
              },
              decoration: const InputDecoration(
                  isDense: true, border: InputBorder.none, focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 4, color: Colors.blue))),
              inputFormatters: [LengthLimitingTextInputFormatter(1), FilteringTextInputFormatter.digitsOnly],
            ),
          ),
        ),
      ),
    );
  }

  void _validate() {
    String otp = otp1.text + otp2.text + otp3.text + otp4.text + otp5.text + otp6.text;
    if (widget.otp == otp) {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const HomeNavigation()));
    }
  }
}
