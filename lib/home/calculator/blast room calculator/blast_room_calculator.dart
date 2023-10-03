import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microcoils/home/calculator/blast%20room%20calculator/product_detail.dart';
import 'package:microcoils/home/calculator/blast%20room%20calculator/result_screen_blast.dart';
import 'package:microcoils/utils/constants/color_constants.dart';
import '../../../utils/screen.dart';
import '../cold room calculator/ambient_room_detail.dart';
import '../widgets/tab_bar.dart';
import '../widgets/tab_bar_view.dart';
import 'blast_ambient_room.dart';
import 'data/calculator.dart';
import 'other_detail.dart';

class BlastRoomCalculatorScreen extends StatefulWidget {
  const BlastRoomCalculatorScreen({super.key});

  @override
  State<BlastRoomCalculatorScreen> createState() => _BlastRoomCalculatorScreenState();
}

class _BlastRoomCalculatorScreenState extends State<BlastRoomCalculatorScreen> with SingleTickerProviderStateMixin {
  List<String> tabs = [
    "Ambient & Room",
    "Product",
    "Other",
  ];
  int currentIndex = 0;
  late PageController pageController;
  late TabController _tabController;
  @override
  void initState() {
    pageController = PageController(initialPage: currentIndex);
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Blast Room"),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.summarize))],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                details(),
              ],
            ),
          ),
          floatingActionButton: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 8),
              onPressed: () {
                if (_tabController.index == 2) {
                  BlastRoomCalculator().calculate();
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const BlastRoomResultScreen(),
                    ),
                  );
                } else {
                  setState(() {
                    _tabController.animateTo(_tabController.index + 1);
                  });
                }
              },
              child: _tabController.index == 2 ? const Text("Summary") : const Text("Next"),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
          resizeToAvoidBottomInset: false),
    );
  }

  Widget details() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.87,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(children: [
          CalculatorTabBar(
            tabs: tabs,
            tabController: _tabController,
            currentIndex: currentIndex,
            onChanged: (p0) {
              setState(() {
                pageController.animateToPage(p0, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                Future.delayed(const Duration(milliseconds: 500)).then((value) {
                  currentIndex = p0;
                });
              });
            },
          ),
          CalculatorTabView(
              tabController: _tabController,
              currentIndex: currentIndex,
              onPageChanged: (p0) {
                setState(() {
                  currentIndex = p0;
                });
              },
              pageController: pageController,
              views: const [
                BlastAmbientRoomForm(),
                BlastRoomProductDetail(),
                BlastRoomOtherDetail(),
              ])
        ]),
      ),
    );
  }
}
