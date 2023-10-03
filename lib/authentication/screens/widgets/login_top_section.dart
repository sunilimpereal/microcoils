import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:microcoils/utils/constants/color_constants.dart';

class LoginTopSection extends StatefulWidget {
  const LoginTopSection({super.key});

  @override
  State<LoginTopSection> createState() => _LoginTopSectionState();
}

class _LoginTopSectionState extends State<LoginTopSection> {
  @override
  void initState() {
    super.initState();
  }

  double height = 0.5;
  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.all(8),
        // height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 150,
            //   decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/logo.png'))),
            // ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1), borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30),
              ),
            )
          ],
        ));
  }
}

class CustomClipperLogin extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path1 = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height - 60)
      ..lineTo(size.width, 0);
    return path1;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

@immutable
class ClipShadowPath extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ClipShadowPath({
    required this.shadow,
    required this.clipper,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: this.clipper,
        shadow: this.shadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({
    required this.shadow,
    required this.clipper,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
