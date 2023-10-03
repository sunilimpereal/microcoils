import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microcoils/home/screen/home_navigation.dart';

class OnBoardingBackground extends StatefulWidget {
  final Widget child;
  Function() onNext;
  OnBoardingBackground({super.key, required this.child, required this.onNext});
  @override
  State<StatefulWidget> createState() {
    return _OnBoardingBackground();
  }
}

class _OnBoardingBackground extends State<OnBoardingBackground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.red,
            child: widget.child,
          ),
          ClipPath(
            clipper: MyCustomClipperTop(),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.23,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.17,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipPath(
              clipper: MyCustomClipperBottom(),
              child: GestureDetector(
                onTap: () {
                  widget.onNext();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.23,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.red,
                              size: 50,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
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
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy, size.width, 0)
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
      ..cubicTo(controlPoint2.dx, controlPoint2.dy, controlPoint1.dx, controlPoint1.dy, 0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
