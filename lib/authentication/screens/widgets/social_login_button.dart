import 'package:flutter/material.dart';

class SocialLoginButton extends StatefulWidget {
  final String image;
  final Function onpressed;
  const SocialLoginButton({
    super.key,
    required this.onpressed,
    required this.image,
  });

  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(100),
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        shadowColor: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Ink.image(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(4),
            fit: BoxFit.fitWidth,
            image: AssetImage(widget.image),
            child: InkWell(
              onTap: () {
                widget.onpressed();
              },
            ),
          ),
        ),
      ),
    );
  }
}
