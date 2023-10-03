import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microcoils/home/calculator/cold%20room%20calculator/other_detail.dart';
import 'package:microcoils/home/calculator/cold%20room%20calculator/product_detail.dart';
import 'package:microcoils/home/calculator/cold%20room%20calculator/result_screen_coldroom.dart';
import 'package:microcoils/utils/constants/color_constants.dart';
import '../../../utils/screen.dart';
import '../widgets/tab_bar.dart';
import '../widgets/tab_bar_view.dart';
import 'ambient_room_detail.dart';
import 'data/calculator.dart';

class ColdRoomCalculatorScreen extends StatefulWidget {
  const ColdRoomCalculatorScreen({super.key});

  @override
  State<ColdRoomCalculatorScreen> createState() => _ColdRoomCalculatorScreenState();
}

class _ColdRoomCalculatorScreenState extends State<ColdRoomCalculatorScreen> with SingleTickerProviderStateMixin {
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
    ColdRoomCalculator().setDefaultValues();
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
            elevation: 0,
            title: Text("Cold Room"),
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
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 8),
              onPressed: () {
                if (_tabController.index == 2) {
                  Map e = ColdRoomCalculator().calculate();
                  log(e.toString());
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const ColdRoomResultScreen(),
                    ),
                  );
                } else {
                  setState(() {
                    _tabController.animateTo(_tabController.index + 1);
                  });
                }
              },
              child: _tabController.index == 2 ? const Text("Summary") : Text("Next"),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          resizeToAvoidBottomInset: false),
    );
  }

  Widget details() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.87,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CalculatorTabBar(
              tabController: _tabController,
              tabs: tabs,
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
              currentIndex: currentIndex,
              tabController: _tabController,
              onPageChanged: (p0) {
                setState(() {
                  currentIndex = p0;
                });
              },
              pageController: pageController,
              views: const [
                AmbientRoomForm(),
                ProductDetail(),
                OtherDetail(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget item(String name) {
    return Center(child: Text(name));
  }
}
