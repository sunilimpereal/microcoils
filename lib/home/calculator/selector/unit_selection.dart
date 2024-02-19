import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:microcoils/home/calculator/selector/selector_screen.dart';
import 'package:microcoils/main.dart';

import '../../../utils/constants/color_constants.dart';
import '../widgets/input_tile_option.dart';
import 'data/sharedpref_selector.dart';

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
            "MEP",
            "MEB",
            "MEC",
            "MEF",
          ],
          inititalValue: sharedPrefSelector.model,
          onChanged: (value) {
            sharedPrefSelector.setModel(value);
          },
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
                        sharedPrefSelector.setUnitType(a);
                      }),
                  SizedBox(
                    width: 8,
                  ),
                  OptionButton(
                      title: "Condensers",
                      option: option,
                      onchanged: (a) {
                        // setState(() {
                        //   option = a;
                        // });
                        // sharedPrefSelector.setUnitType(a);
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
            color: title == option ? Colors.white : ColorConstants.primary,
          ),
        ),
      ),
    );
  }
}
