import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:microcoils/home/calculator/widgets/form_section.dart';

import '../widgets/input_tile_number.dart';
import '../widgets/input_tile_option.dart';

class ThermodynamicsTab extends StatefulWidget {
  const ThermodynamicsTab({super.key});

  @override
  State<ThermodynamicsTab> createState() => _ThermodynamicsTabState();
}

class _ThermodynamicsTabState extends State<ThermodynamicsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FormSection(
            title: "Theromodynamics",
            formItems: [
              InputTileNumber(
                title: "Capacity",
                initialValue: 3.5,
                maxValue: 5,
                minValue: 1,
                gapValue: 5,
                unit: "kW",
                onChanged: (value) {},
              ),
              InputTileOption(
                title: "Refrigerant",
                options: const [
                  "R404A",
                  "A404A",
                  "R404b",
                ],
                inititalValue: "R404A",
                onChanged: (value) {},
              ),
              InputTileNumber(
                title: "Evaporation Temp",
                initialValue: -8,
                maxValue: 15,
                minValue: -10,
                gapValue: 1,
                unit: "°C",
                onChanged: (value) {},
              ),
              InputTileNumber(
                title: "Condenser Temp",
                initialValue: 45,
                maxValue: 100,
                minValue: 0,
                gapValue: 5,
                unit: "°C",
                onChanged: (value) {},
              ),
              InputTileNumber(
                title: "RH",
                initialValue: 78,
                maxValue: 100,
                minValue: 0,
                gapValue: 5,
                unit: "%",
                onChanged: (value) {},
              ),
              InputTileNumber(
                title: "Room Temp",
                initialValue: 0,
                maxValue: 100,
                minValue: 0,
                gapValue: 5,
                unit: "°C",
                onChanged: (value) {},
              ),
            ],
          ),
          FormSection(
            title: "Fin Spacing",
            formItems: [
              InputTileOption(
                title: "Fin Spacing",
                options: const [
                  "Any",
                  "item 1",
                  "item 2",
                ],
                inititalValue: "Any",
                onChanged: (value) {},
              ),
              InputTileOption(
                title: "Defrosting",
                options: const [
                  "Electrical defrost",
                  "item 2",
                  "item 3",
                ],
                inititalValue: "Electrical defrost",
                onChanged: (value) {},
              ),
            ],
          ),
          const SizedBox(
            height: 200,
          )
        ],
      ),
    );
  }
}
