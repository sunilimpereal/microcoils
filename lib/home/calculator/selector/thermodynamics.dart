import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:microcoils/home/calculator/selector/data/sharedpref_selector.dart';
import 'package:microcoils/home/calculator/widgets/form_section.dart';
import 'package:microcoils/main.dart';

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
                initialValue: sharedPrefSelector.capacity,
                maxValue: 5,
                minValue: 1,
                gapValue: 5,
                unit: "kW",
                onChanged: (value) {
                  sharedPrefSelector.setCapacity(double.parse(value));
                },
              ),
              InputTileOption(
                title: "Refrigerant",
                options: const [
                  "R134A",
                  "A404A",
                  "R507b",
                  "R22",
                ],
                inititalValue: sharedPrefSelector.refrigerant,
                onChanged: (value) {
                  sharedPrefSelector.setRefrigerant(value);
                },
              ),
              InputTileNumber(
                title: "Evaporation Temp",
                initialValue: sharedPrefSelector.evaporationTemp,
                maxValue: 15,
                minValue: -10,
                gapValue: 1,
                unit: "°C",
                onChanged: (value) {
                  sharedPrefSelector.setEvaporationTemp(double.parse(value));
                },
              ),
              InputTileNumber(
                title: "Condenser Temp",
                initialValue: sharedPrefSelector.condenserTemp,
                maxValue: 100,
                minValue: 0,
                gapValue: 5,
                unit: "°C",
                onChanged: (value) {
                  sharedPrefSelector.setCondenserTemp(double.parse(value));
                },
              ),
              InputTileNumber(
                title: "RH",
                initialValue: sharedPrefSelector.rh,
                maxValue: 100,
                minValue: 0,
                gapValue: 5,
                unit: "%",
                onChanged: (value) {},
              ),
              InputTileNumber(
                title: "Room Temp",
                initialValue: sharedPrefSelector.roomTemp,
                maxValue: 100,
                minValue: 0,
                gapValue: 5,
                unit: "°C",
                onChanged: (value) {
                  sharedPrefSelector.setRoomTemp(double.parse(value));
                },
              ),
            ],
          ),
          FormSection(
            title: "Fin Spacing",
            formItems: [
              InputTileOption(
                title: "Fin Spacing",
                options: const [
                  "4",
                  "4.5",
                  "6",
                  "7",
                  "9",
                  "10",
                ],
                inititalValue: sharedPrefSelector.finSpacing.toString(),
                onChanged: (value) {
                  sharedPrefSelector.setFinSpacing(double.parse(value));
                },
              ),
              InputTileOption(
                title: "Defrosting",
                options: const [
                  "Electrical Defrost",
                  "Air Defrost",
                  "Hot Gas Defrost",
                  "Without Defrost",
                ],
                inititalValue: sharedPrefSelector.defrosting,
                onChanged: (value) {
                  sharedPrefSelector.setDefrosting(value);
                },
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
