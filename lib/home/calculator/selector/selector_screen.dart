import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:microcoils/home/calculator/selector/air_coolers.dart';
import 'package:microcoils/home/calculator/selector/data/calulator_selector.dart';
import 'package:microcoils/home/calculator/selector/thermodynamics.dart';
import 'package:microcoils/home/calculator/selector/unit_selection.dart';
import 'package:microcoils/utils/constants/color_constants.dart';

import '../../../main.dart';
import '../cold room calculator/data/sharedpref_coldroom.dart';
import '../widgets/input_tile_option.dart';
import '../widgets/tab_bar.dart';
import '../widgets/tab_bar_view.dart';

class SelectorScreen extends StatefulWidget {
  const SelectorScreen({super.key});

  @override
  State<SelectorScreen> createState() => _SelectorScreenState();
}

class _SelectorScreenState extends State<SelectorScreen> with SingleTickerProviderStateMixin {
  List<String> tabs = ["Unit Selection", "Thermodynamics", "Air Coolers"];
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
    SelectorCalculator().setDefaultValues();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Selector"),
        ),
        body: Container(
          child: Column(
            children: [details()],
          ),
        ),
        floatingActionButton: Container(
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width * 0.9,
          child: _tabController.index == 2
              ? Container()
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 8),
                  onPressed: () {
                    if (_tabController.index == 2) {
                    } else {
                      setState(() {
                        _tabController.animateTo(_tabController.index + 1);
                      });
                    }
                  },
                  child: _tabController.index == 2 ? null : const Text("Next"),
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false);
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
                  pageController.animateToPage(p0,
                      duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
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
                UnitSelectionTab(),
                ThermodynamicsTab(),
                AirCoolers(),
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
