import 'package:flutter/material.dart';

class CalculatorCard extends StatefulWidget {
  final Color color;
  final String image;
  final String name;
  final Function onTap;
  const CalculatorCard({
    super.key,
    required this.onTap,
    required this.name,
    required this.color,
    required this.image,
  });

  @override
  State<CalculatorCard> createState() => _CalculatorCardState();
}

class _CalculatorCardState extends State<CalculatorCard> with SingleTickerProviderStateMixin {
  static const clickAnimationDuration = 100;
  double _scaleTransformValue = 1;

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: clickAnimationDuration),
      lowerBound: 0,
      upperBound: 0.05,
    )..addListener(() {
        setState(() {
          _scaleTransformValue = 1 - animationController.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _scaleTransformValue,
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(8),
        color: widget.color,
        elevation: 8,
        shadowColor: widget.color.withOpacity(0.5),
        child: InkWell(
          onTap: () {
            _shrinkButtonSize();
            widget.onTap();
            _restoreButtonSize();
          },
          onTapDown: (_) => _shrinkButtonSize(),
          onTapCancel: _restoreButtonSize,
          child: Stack(
            children: [
              Positioned(
                  top: 25,
                  right: -50,
                  child: SizedBox(
                    width: 160,
                    height: 160,
                    child: Opacity(
                      opacity: 0.4,
                      child: Image(
                        image: AssetImage("assets/images/${widget.image}"),
                      ),
                    ),
                  )),
              Positioned(
                  child: Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _shrinkButtonSize() {
    animationController.forward();
  }

  _restoreButtonSize() {
    Future.delayed(const Duration(milliseconds: clickAnimationDuration), () => animationController.reverse());
  }
}
