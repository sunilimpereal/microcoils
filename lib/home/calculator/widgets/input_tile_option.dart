import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTileOption extends StatefulWidget {
  final String title;
  final List<String> options;
  final Function(String)? onChanged;
  final String inititalValue;
  const InputTileOption({
    super.key,
    required this.title,
    required this.options,
    this.onChanged,
    required this.inititalValue,
  });

  @override
  State<InputTileOption> createState() => _InputTileOptionState();
}

class _InputTileOptionState extends State<InputTileOption> {
  bool isActive = false;
  TextStyle activeStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  TextStyle inActiveStyle = const TextStyle(color: Colors.black);
  //scroll
  late FixedExtentScrollController scrollController;

  // overlay
  GlobalKey _key = LabeledGlobalKey("button_icon");
  late OverlayEntry _overlayEntry;
  late Size buttonSize;
  late Offset buttonPosition;
  bool isMenuOpen = false;
  findButton() {
    RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  @override
  void initState() {
    log(widget.inititalValue.toString());
    scrollController = FixedExtentScrollController(initialItem: widget.options.indexOf(widget.inititalValue));
    super.initState();
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.transparent,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              closeMenu();
            },
            child: Stack(
              children: [
                Positioned(
                  top: buttonPosition.dy + buttonSize.height + 4,
                  left: buttonPosition.dx,
                  width: buttonSize.width,
                  child: Container(
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      elevation: 10,
                      child: dropDown(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void openMenu() {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  void closeMenu() {
    _overlayEntry.remove();
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onLongPress: () {
          HapticFeedback.lightImpact();
          setState(() {
            isActive = true;
          });
        },
        onLongPressUp: () {
          setState(() {
            isActive = false;
          });
        },
        onTap: () {
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey.shade100.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              tileColor: isActive ? Colors.blue.shade100.withOpacity(0.2) : null,
              enableFeedback: true,
              title: Text(widget.title, style: isActive ? activeStyle : inActiveStyle),
              // scroll selector
              trailing: Container(
                height: 33,
                width: MediaQuery.of(context).size.width * 0.36,
                alignment: Alignment.centerRight,
                child: CupertinoPicker(
                  key: _key,
                  useMagnifier: true,
                  scrollController: scrollController,
                  magnification: 1.1,
                  itemExtent: 33,
                  diameterRatio: 500,
                  onSelectedItemChanged: (value) {
                    widget.onChanged!(widget.options[value]);
                  },
                  children: widget.options.map((e) => text(e)).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget text(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.36,
        child: Text(
          text,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }

  Widget dropDown() {
    return widget.options.length < 4
        ? Column(
            children: widget.options.map((e) {
            return ListTile(
              title: Text(e),
              onTap: () {
                closeMenu();
                widget.onChanged!(e);
                scrollController.animateToItem(widget.options.indexOf(e), duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                setState(() {});
              },
            );
          }).toList())
        : Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 3,
            child: SingleChildScrollView(
              child: Column(
                  children: widget.options.map((e) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 7,
                  ),
                  title: Text(
                    e,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    closeMenu();
                    widget.onChanged!(e);
                    scrollController.animateToItem(widget.options.indexOf(e), duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                    setState(() {});
                  },
                );
              }).toList()),
            ),
          );
  }
}
