import 'package:flutter/material.dart';

import '../../../main.dart';
import '../widgets/form_section.dart';
import '../widgets/input_tile_number.dart';
import '../widgets/input_tile_option.dart';

class OtherDetail extends StatefulWidget {
  const OtherDetail({super.key});

  @override
  State<OtherDetail> createState() => _OtherDetailState();
}

class _OtherDetailState extends State<OtherDetail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FormSection(
              title: "Produt Detail",
              formItems: [
                InputTileOption(
                  title: "Door Opening Frequency",
                  options: const [
                    "Light",
                    "Normal",
                    "Heavy",
                  ],
                  inititalValue: sharedPrefColdRoom.doorOpenFreq,
                  onChanged: (value) {
                    sharedPrefColdRoom.setDoorOpenFreq(value);
                  },
                ),
                InputTileNumber(
                  title: "No. of persons in room",
                  initialValue: sharedPrefColdRoom.noPersons,
                  maxValue: 20,
                  minValue: 1,
                  gapValue: 5,
                  unit: "",
                  onChanged: (value) {
                    sharedPrefColdRoom.setNoPersons(double.parse(value));
                  },
                ),
                InputTileNumber(
                  title: "Working hours",
                  initialValue: sharedPrefColdRoom.workingHrs,
                  maxValue: 24,
                  minValue: 1,
                  gapValue: 5,
                  unit: "hrs",
                  onChanged: (value) {
                    sharedPrefColdRoom.setWorkingHrs(double.parse(value));
                  },
                ),
                InputTileNumber(
                  title: "Total rated power of all mototrs",
                  initialValue: sharedPrefColdRoom.totRatPow,
                  maxValue: 5000,
                  minValue: 1,
                  gapValue: 5,
                  unit: "W",
                  onChanged: (value) {
                    sharedPrefColdRoom.setTotRatPow(double.parse(value));
                  },
                ),
                InputTileNumber(
                  title: "Motor Running hours",
                  initialValue: sharedPrefColdRoom.motRunHrs,
                  maxValue: 100,
                  minValue: 1,
                  gapValue: 5,
                  unit: "hrs",
                  onChanged: (value) {
                    sharedPrefColdRoom.setMotRunHrs(double.parse(value));
                  },
                ),
                InputTileNumber(
                  title: "Lighting",
                  initialValue: sharedPrefColdRoom.lighting,
                  maxValue: 50,
                  minValue: 1,
                  gapValue: 5,
                  unit: "W/m2",
                  onChanged: (value) {
                    sharedPrefColdRoom.setLighting(double.parse(value));
                  },
                ),
                InputTileNumber(
                  title: "Operating hours",
                  initialValue: sharedPrefColdRoom.operatingHrs,
                  maxValue: 60,
                  minValue: 1,
                  gapValue: 5,
                  unit: "hrs",
                  onChanged: (value) {
                    sharedPrefColdRoom.setOperatingHrs(double.parse(value));
                  },
                ),
                InputTileNumber(
                  title: "Compresseor Operating hours",
                  initialValue: sharedPrefColdRoom.compOperatingHrs,
                  maxValue: 60,
                  minValue: 1,
                  gapValue: 5,
                  unit: "hrs",
                  onChanged: (value) {
                    sharedPrefColdRoom.setCompOperatingHrs(double.parse(value));
                  },
                ),
                InputTileNumber(
                  title: "Safety Factor",
                  initialValue: sharedPrefColdRoom.safetyFactor,
                  maxValue: 60,
                  minValue: 1,
                  gapValue: 5,
                  unit: "%",
                  onChanged: (value) {
                    sharedPrefColdRoom.setSafetyFactor(double.parse(value));
                  },
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
