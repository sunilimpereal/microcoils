import 'package:flutter/material.dart';

class CalculatorTabView extends StatefulWidget {
  final List<Widget> views;
  final int currentIndex;
  final Function(int) onPageChanged;
  final PageController pageController;
  final TabController tabController;
  const CalculatorTabView(
      {super.key,
      required this.currentIndex,
      required this.views,
      required this.onPageChanged,
      required this.pageController,
      required this.tabController});

  @override
  State<CalculatorTabView> createState() => CalculatorTabViewState();
}

class CalculatorTabViewState extends State<CalculatorTabView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        child: TabBarView(controller: widget.tabController, children: widget.views)

        // PageView.builder(
        //   controller: widget.pageController,
        //   itemCount: widget.views.length,
        //   onPageChanged: ((value) => widget.onPageChanged(value)),
        //   itemBuilder: (context, index) {
        //     return widget.views[index];
        //   },
        // ),
        );
  }
}
