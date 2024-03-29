import 'package:flutter/material.dart';
import 'package:microcoils/utils/constants/image_constaants.dart';

class FormSection extends StatefulWidget {
  final List<Widget> formItems;
  final String title;
  const FormSection({
    super.key,
    required this.formItems,
    required this.title,
  });

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> with SingleTickerProviderStateMixin {
  bool isOpen = true;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isOpen = !isOpen;
                _controller.forward();
              });
            },
            child: Container(
              // color: ColorConstants.secondary.shade200,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstants.redbg), fit: BoxFit.fitWidth)),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white
                        // fontSize: 16,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          isOpen
              ? AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _controller,
                      child: child,
                    );
                  },
                  child: Column(
                    children: widget.formItems,
                  ),
                  // builder: (BuildContext context, Widget child) {
                  //   return Transform.rotate(
                  //     angle: _controller.value * 2.2 * math.pi,
                  //     child: child,
                  //   );
                  // },
                )
              : Container()
        ],
      ),
    );
  }
}
