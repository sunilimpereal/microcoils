import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeCard extends StatefulWidget {
  final Function onTap;
  final String heading;
  final String description;
  final String? image;
  const HomeCard({
    super.key,
    required this.onTap,
    required this.description,
    required this.heading,
    this.image,
  });

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> with SingleTickerProviderStateMixin {
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
        child: GestureDetector(
            onTap: () {
              _shrinkButtonSize();
              widget.onTap();
              _restoreButtonSize();
            },
            onTapDown: (_) => _shrinkButtonSize(),
            onTapCancel: _restoreButtonSize,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 8, left: 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.15,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  widget.heading,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  widget.description,
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.354,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: widget.image == null
                            ? null
                            : BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(widget.image ?? ''), fit: BoxFit.fitHeight)),
                      ),
                    ),
                  )
                ],
              ),
            )));
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
    Future.delayed(
        const Duration(milliseconds: clickAnimationDuration), () => animationController.reverse());
  }
}
