import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microcoils/home/calculator/blast%20room%20calculator/product_detail.dart';
import 'package:microcoils/home/calculator/blast%20room%20calculator/result_screen_blast.dart';

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

class _BlastRoomCalculatorScreenState extends State<BlastRoomCalculatorScreen> {
  List<String> tabs = [
    "Ambient & Room",
    "Product",
    "Other",
  ];
  int currentIndex = 0;
  late PageController pageController;
  @override
  void initState() {
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(CupertinoIcons.back)),
                    const Text(
                      "Blast Room",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
            BlastRoomCalculator().calculate();

            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const BlastRoomResultScreen(),
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
        child: Column(children: [
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
              views: [
                BlastAmbientRoomForm(),
                BlastRoomProductDetail(),
                BlastRoomOtherDetail(),
              ])
        ]),
      ),
    );
  }
}
