import 'package:flutter/material.dart';
import 'package:microcoils/utils/constants/color_constants.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) onChanged;
  final int currentIndex;
  const BottomNavBar({super.key, required this.onChanged, required this.currentIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        // backgroundColor: Colors.white.withOpacity(0.8),
        // backgroundColor: ColorConstants.secondary.shade300,
        elevation: 4,
        currentIndex: widget.currentIndex,
        onTap: (i) {
          widget.onChanged(i);
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.ac_unit),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ]);
  }
}
