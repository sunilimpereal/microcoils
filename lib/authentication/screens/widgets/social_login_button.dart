import 'package:flutter/material.dart';

class SocialLoginButton extends StatefulWidget {
  final String image;
  final Function onpressed;
  final String name;
  const SocialLoginButton({
    super.key,
    required this.onpressed,
    required this.image,
    required this.name,
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
        elevation: 2,
        borderRadius: BorderRadius.circular(100),
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        shadowColor: Colors.black26,
        child: InkWell(
          onTap: () {
            widget.onpressed();
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Ink.image(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(4),
                      fit: BoxFit.fitWidth,
                      image: AssetImage(widget.image),
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
