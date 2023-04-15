import 'package:flutter/material.dart';

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
              color: Colors.white10,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
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
