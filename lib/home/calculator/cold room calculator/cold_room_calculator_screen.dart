import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microcoils/home/calculator/cold%20room%20calculator/other_detail.dart';
import 'package:microcoils/home/calculator/cold%20room%20calculator/product_detail.dart';
import 'package:microcoils/home/calculator/cold%20room%20calculator/result_screen_coldroom.dart';
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

class _ColdRoomCalculatorScreenState extends State<ColdRoomCalculatorScreen> {
  List<String> tabs = [
    "Ambient & Room",
    "Product",
    "Other",
  ];
  int currentIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    ColdRoomCalculator().setDefaultValues();
    pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(CupertinoIcons.back)),
                        const Text(
                          "Cold Room",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              CupertinoPageRoute(
                                builder: (context) => const ColdRoomCalculatorScreen(),
                              ),
                            );
                            // ColdRoomCalculator().setDefaultValues();
                            // setState(() {});
                          },
                          icon: const Icon(
                            Icons.replay_rounded,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              details(),
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(elevation: 8),
          onPressed: () {
            Map e = ColdRoomCalculator().calculate();
            log(e.toString());
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const ColdRoomResultScreen(),
              ),
            );
          },
          child: const Text("Summary"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      ),
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
