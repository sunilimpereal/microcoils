import 'package:flutter/material.dart';
import 'package:microcoils/utils/constants/color_constants.dart';

class CalculatorTabBar extends StatefulWidget {
  final List<String> tabs;
  final int currentIndex;
  final Function(int) onChanged;
  final TabController tabController;
  const CalculatorTabBar({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.onChanged,
    required this.tabController,
  });

  @override
  State<CalculatorTabBar> createState() => _CalculatorTabBarState();
}

class _CalculatorTabBarState extends State<CalculatorTabBar> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: TabBar(
          labelColor: Theme.of(context).colorScheme.onPrimary,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          indicatorColor: Theme.of(context).colorScheme.onPrimary,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 4,
          // indicator: BoxDecoration(borderRadius: BorderRadius.circular(2), shape: BoxShape.rectangle, color: Colors.red),
          controller: widget.tabController,
          labelPadding: EdgeInsets.zero,
          tabs: widget.tabs
              .map((e) => Tab(
                    iconMargin: EdgeInsets.only(bottom: 4),
                    text: e,
                  ))
              .toList()),
    );
  }

  @override
  Widget build1(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height * 0.07,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.06,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.tabs.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () => setState(
                        () {
                          widget.onChanged(index);
                        },
                      ),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: widget.currentIndex == index ? 10 : 8.0,
                                vertical: 8,
                              ),
                              child: Text(
                                widget.tabs[index],
                                style: widget.currentIndex == index
                                    ? TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ColorConstants.secondary.shade800)
                                    : const TextStyle(),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: widget.currentIndex == index ? widget.tabs[index].length * 7 : 0,
                              height: 5.5,
                              decoration: BoxDecoration(
                                color: ColorConstants.primary.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
            ),
          ),
        ],
      ),
    );
  }
}
