import 'package:flutter/material.dart';

import '../../../main.dart';
import '../widgets/form_section.dart';
import '../widgets/input_tile_number.dart';
import '../widgets/input_tile_option.dart';
import 'data/sharedpref_bastroom.dart';

class BlastRoomOtherDetail extends StatefulWidget {
  const BlastRoomOtherDetail({super.key});

  @override
  State<BlastRoomOtherDetail> createState() => _BlastRoomOtherDetailState();
}

class _BlastRoomOtherDetailState extends State<BlastRoomOtherDetail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          FormSection(
            title: "Product Detail",
            formItems: [
              InputTileOption(
                title: "Door Opening Frequency",
                options: [
                  "Light",
                  "Normal",
                  "Heavy",
                ],
                inititalValue: sharedPrefsBlastRoom.doorOpenFreq,
                onChanged: (value) {
                  sharedPrefBlastRoom.setDoorOpenFreq(value);
                },
              ),
              InputTileNumber(
                title: "Total rated power of all mototrs",
                initialValue: 1500,
                maxValue: 5000,
                minValue: 1,
                gapValue: 5,
                unit: "W",
                onChanged: (value) {
                  sharedPrefBlastRoom.setTotRatPow(double.parse(value));
                },
              ),
              InputTileNumber(
                title: "Safety Factor",
                initialValue: 6,
                maxValue: 60,
                minValue: 1,
                gapValue: 5,
                unit: "%",
                onChanged: (value) {
                  sharedPrefBlastRoom.setSafetyFactor(double.parse(value));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
