import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:microcoils/utils/constants/color_constants.dart';

class InputTileNumber extends StatefulWidget {
  final String title;
  final double initialValue;
  final double minValue;
  final double maxValue;
  final double gapValue;
  final String unit;
  final Function(String)? onChanged;

  const InputTileNumber({
    Key? key,
    required this.title,
    required this.initialValue,
    required this.gapValue,
    required this.maxValue,
    required this.minValue,
    required this.unit,
    this.onChanged,
  }) : super(key: key);

  @override
  State<InputTileNumber> createState() => _InputTileNumberState();
}

class _InputTileNumberState extends State<InputTileNumber> {
  final TextEditingController _controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool hasFocus = false;
  int value = 5;
  double percentage = 0;
  bool isActive = false;

  TextStyle activeStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  TextStyle inActiveStyle =
      TextStyle(color: ColorConstants.secondary.shade800, fontWeight: FontWeight.bold);
  @override
  void initState() {
    focusNode.addListener(() {
      setState(() {});
    });
    _controller.text = widget.initialValue.toString();

    _controller.addListener(() {
      widget.onChanged!(_controller.text);
      log(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressMoveUpdate: (details) {
        setState(() {
          percentage = ((details.localPosition.dx / MediaQuery.of(context).size.width * 1.2));
          value = (widget.maxValue * percentage).ceil();
          _controller.text = value.toString();
          widget.onChanged!(_controller.text);
        });
      },
      onLongPress: () {
        HapticFeedback.lightImpact();
        setState(() {
          isActive = true;
        });
      },
      onTap: () {
        focusNode.requestFocus();
      },
      onLongPressUp: () {
        setState(() {
          isActive = false;
        });
      },
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade100.withOpacity(0.6),
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        tileColor: isActive ? ColorConstants.primary.withOpacity(0.2) : null,
        enableFeedback: true,
        title:
            Text(widget.title, style: isActive || focusNode.hasFocus ? activeStyle : inActiveStyle),
        trailing: Container(
          width: MediaQuery.of(context).size.width * 0.39,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.tertiarySystemFill,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.16,
                      height: 40,
                      alignment: Alignment.centerRight,
                      child: TextField(
                        controller: _controller,
                        onChanged: ((value) {
                          if (double.parse(value) > widget.maxValue) {
                            _controller.text = widget.maxValue.toString();
                            return;
                          }
                          if (double.parse(value) < widget.minValue) {
                            _controller.text = widget.minValue.toString();
                            return;
                          }

                          widget.onChanged == null ? null : widget.onChanged!(_controller.text);
                        }),
                        focusNode: focusNode,
                        textAlign: TextAlign.end,
                        style: isActive || focusNode.hasFocus ? activeStyle : inActiveStyle,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            isDense: true),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 04.0),
                        child: Center(
                          child: Text(
                            " ${widget.unit}",
                            style: isActive || focusNode.hasFocus ? activeStyle : inActiveStyle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
