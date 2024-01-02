import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:microcoils/home/screen/home_screen.dart';
import 'package:microcoils/main.dart';
import 'package:microcoils/utils/constants/color_constants.dart';
import 'package:microcoils/utils/shared_preferences.dart';

import '../../common/error_popup.dart';
import '../../home/profile/widgets/app_bar.dart';
import '../../home/screen/home_navigation.dart';
import '../../utils/screen.dart';
import '../data/repository/auth_repository.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String otp;
  final String email;
  const OtpVerificationScreen({
    super.key,
    required this.otp,
    required this.email,
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

  String? error = null;

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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const CustomAppBar(title: ""),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verification",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.primary.shade400),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Enter 6 digits verification code sent to your number",
                    style: TextStyle(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
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
            SizedBox(
              height: 16,
            ),
            error != null
                ? Text(
                    " Inalid Otp ! Please re enter the code",
                    style: TextStyle(color: Colors.red),
                  )
                : Container()
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
          color: ColorConstants.secondary.shade200,
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
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: ColorConstants.primary),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validate() {
    String otp = otp1.text + otp2.text + otp3.text + otp4.text + otp5.text + otp6.text;
    if (widget.otp == otp) {
      AuthRepository().validateOtp(email: widget.email, otp: otp).then((value) {
        // log(loginResponseToJson(value!));
        if (value != null) {
          sharedPrefs.setUserDetails(
            id: value?.user?.id.toString() ?? '',
            email: value?.user?.email ?? '',
            name: value?.user?.name ?? '',
            number: value?.user?.contact ?? '',
            address: value?.user?.address ?? '',
            company: value?.user?.companyName ?? '',
            photoUrl: value?.user?.imageUrl ?? '',
          );
          sharedPrefs.setLoggedIn();
          Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) => const HomeScreen()),
            ModalRoute.withName('/'),
          );
        } else {
          showErrorPopup(context, 'Login failed. Please check your credentials.');
        }
      });
    } else {
      setState(() {
        otp1.clear();
        otp2.clear();
        otp3.clear();
        otp4.clear();
        otp5.clear();
        otp6.clear();
        error = "Invalid Otp";
        focus1.requestFocus();
      });
    }
  }
}
