import 'dart:developer';

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
  double dt1 = 5;
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
                  "R404A",
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
                maxValue: 5,
                minValue: -40,
                gapValue: 1,
                unit: "°C",
                onChanged: (value) {
                  sharedPrefSelector.setEvaporationTemp(double.parse(value));
                  setState(() {});
                },
              ),
              AbsorbPointer(
                child: InputTileNumber(
                  title: "Condensing Temp",
                  initialValue: sharedPrefSelector.condenserTemp,
                  maxValue: 100,
                  minValue: 0,
                  gapValue: 5,
                  unit: "°C",
                  onChanged: (value) {
                    sharedPrefSelector.setCondenserTemp(double.parse(value));
                  },
                ),
              ),
              InputTileNumber(
                key: Key(dt1.toString()),
                title: "DT1",
                initialValue: sharedPrefSelector.dt1,
                maxValue: 15,
                minValue: 0,
                gapValue: 5,
                unit: "",
                onChanged: (value) {
                  double value1 = double.parse(value);
                  sharedPrefSelector.setDT1(value1);

                  if (value1 == 5.0) {
                    sharedPrefSelector.setRH("96");
                  }
                  if (value1 == 6.0) {
                    sharedPrefSelector.setRH("90");
                  }
                  if (value1 == 7.0) {
                    sharedPrefSelector.setRH("83");
                  }
                  if (value1 == 9.0) {
                    sharedPrefSelector.setRH("74");
                  }
                  if (value1 == 10.0) {
                    sharedPrefSelector.setRH("71");
                  }
                  if (value1 == 11.0) {
                    sharedPrefSelector.setRH("67");
                  }
                  if (value1 == 12.0) {
                    sharedPrefSelector.setRH("64");
                  }
                  if (value1 == 13.0) {
                    sharedPrefSelector.setRH("62");
                  }

                  setState(() {});
                },
              ),
              AbsorbPointer(
                child: InputTileOption(
                  key: Key("rh${sharedPrefSelector.rh}"),
                  title: "RH",
                  options: const [
                    "96",
                    "90",
                    "83",
                    "74",
                    "71",
                    "67",
                    "64",
                    "62",
                  ],
                  inititalValue: sharedPrefSelector.rh,
                  onChanged: (value) {
                    sharedPrefSelector.setRH(value);

                    setState(() {});
                    log(sharedPrefSelector.dt1.toString());
                  },
                ),
              ),
              // InputTileNumber(
              //   title: "RH",
              //   initialValue: sharedPrefSelector.rh,
              //   maxValue: 100,
              //   minValue: 0,
              //   gapValue: 5,
              //   unit: "%",
              //   onChanged: (value) {},
              // ),

              InputTileNumber(
                key: Key("rt" +
                    (sharedPrefSelector.evaporationTemp + sharedPrefSelector.dt1).toString()),
                title: "Room Temp",
                initialValue: sharedPrefSelector.evaporationTemp + sharedPrefSelector.dt1,
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
