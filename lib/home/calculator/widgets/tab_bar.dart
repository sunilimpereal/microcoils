import 'package:flutter/material.dart';

class CalculatorTabBar extends StatefulWidget {
  final List<String> tabs;
  final int currentIndex;
  final Function(int) onChanged;
  const CalculatorTabBar({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  State<CalculatorTabBar> createState() => _CalculatorTabBarState();
}

class _CalculatorTabBarState extends State<CalculatorTabBar> {
  @override
  Widget build(BuildContext context) {
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
                                style: widget.currentIndex == index ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16) : const TextStyle(),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: widget.currentIndex == index ? widget.tabs[index].length * 7 : 0,
                              height: 5.5,
                              decoration: BoxDecoration(
                                color: Colors.blue,
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
