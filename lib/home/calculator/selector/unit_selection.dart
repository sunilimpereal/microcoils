import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:microcoils/home/calculator/selector/selector_screen.dart';

import '../../../utils/constants/color_constants.dart';
import '../widgets/input_tile_option.dart';

class UnitSelectionTab extends StatefulWidget {
  const UnitSelectionTab({super.key});

  @override
  State<UnitSelectionTab> createState() => _UnitSelectionTabState();
}

class _UnitSelectionTabState extends State<UnitSelectionTab> {
  String option = "Air Coolers";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        unitSelector(),
        InputTileOption(
          title: "Models",
          options: const [
            "Any Series",
            "Series 1",
            "Series 2",
            "Series 3",
          ],
          inititalValue: "Any Series",
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget unitSelector() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ListTile(
              title: Text("Unit Selector"),
              subtitle: Row(
                children: [
                  OptionButton(
                      title: "Air Coolers",
                      option: option,
                      onchanged: (a) {
                        setState(() {
                          option = a;
                        });
                      }),
                  SizedBox(
                    width: 8,
                  ),
                  OptionButton(
                      title: "Condensers",
                      option: option,
                      onchanged: (a) {
                        setState(() {
                          option = a;
                        });
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.title,
    required this.option,
    required this.onchanged,
  });

  final String title;
  final String option;
  final Function(String p1) onchanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: ColorConstants.primary,
                ),
                borderRadius: BorderRadius.circular(16)),
            backgroundColor: ColorConstants.primary.withOpacity(title == option ? 1 : 0.01)),
        onPressed: () {
          onchanged(title);
        },
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: title == option ? null : ColorConstants.primary,
          ),
        ),
      ),
    );
  }
}
