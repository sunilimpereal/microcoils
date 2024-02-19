import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microcoils/home/calculator/widgets/form_section.dart';

import '../../../main.dart';
import '../widgets/input_tile_number.dart';
import '../widgets/input_tile_option.dart';
import 'data/sharedpref_coldroom.dart';

class AmbientRoomForm extends StatefulWidget {
  const AmbientRoomForm({super.key});

  @override
  State<AmbientRoomForm> createState() => _AmbientRoomFormState();
}

class _AmbientRoomFormState extends State<AmbientRoomForm> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormSection(
                title: "Cold Room Details",
                formItems: [
                  InputTileNumber(
                    title: "External Length",
                    initialValue: sharedPrefColdRoom.externalLength,
                    maxValue: 10,
                    minValue: 0,
                    gapValue: 1,
                    unit: "m",
                    onChanged: (value) {
                      sharedPrefColdRoom.setExternalLength(double.parse(value));
                    },
                  ),
                  InputTileNumber(
                    title: "External Width",
                    initialValue: sharedPrefColdRoom.externalWidth,
                    maxValue: 10,
                    minValue: 0,
                    gapValue: 1,
                    unit: "m",
                    onChanged: (value) {
                      sharedPrefColdRoom.setExternalWidth(double.parse(value));
                    },
                  ),
                  InputTileNumber(
                    title: "External Height",
                    initialValue: sharedPrefColdRoom.externalHeight,
                    maxValue: 10,
                    minValue: 0,
                    gapValue: 1,
                    unit: "m",
                    onChanged: (value) {
                      sharedPrefColdRoom.setExternalHeight(double.parse(value));
                    },
                  ),
                  InputTileOption(
                    title: "Room Location",
                    options: const [
                      "Outside",
                      "Inside",
                    ],
                    inititalValue: sharedPrefsColdRoom.roomLocation,
                    onChanged: (value) {
                      sharedPrefColdRoom.setRoomLocation(value);
                    },
                  ),
                  InputTileNumber(
                    title: "Room Temperature",
                    initialValue: sharedPrefColdRoom.roomTemperature,
                    maxValue: 100,
                    minValue: -50,
                    gapValue: 1,
                    unit: "°C",
                    onChanged: (value) {
                      sharedPrefColdRoom.setRoomTemperature(double.parse(value));
                    },
                  ),
                  InputTileNumber(
                    title: "Room RH",
                    initialValue: double.parse(sharedPrefColdRoom.roomRH),
                    maxValue: 100,
                    minValue: 0,
                    gapValue: 1,
                    unit: "%",
                    onChanged: (value) {
                      sharedPrefColdRoom.setRoomRH(value);
                    },
                  ),
                  InputTileOption(
                    title: "Insulation Thickness",
                    options: const [
                      "60 mm",
                      "80 mm",
                      "100 mm",
                      "120 mm",
                      "150 mm",
                    ],
                    inititalValue: "${sharedPrefsColdRoom.insulationThickness.toInt()} mm",
                    onChanged: (value) {
                      setState(() {});
                      sharedPrefColdRoom
                          .setInsulationThickness(double.parse(value.replaceAll(" mm", "")));
                    },
                  ),
                  InputTileOption(
                    title: "Insulation",
                    options: const [
                      "PUF 40kg/m\u00B3",
                      "PS 56kg/m\u00B3",
                      "PS 56kg/m\u00B3",
                    ],
                    inititalValue: sharedPrefsColdRoom.insulation,
                    onChanged: (value) {
                      sharedPrefColdRoom.setInsulation(value);
                    },
                  ),
                ],
              ),
              FormSection(
                title: "Ambient Details",
                formItems: [
                  InputTileNumber(
                    title: "Ambient Temperature",
                    initialValue: sharedPrefColdRoom.ambTemp,
                    maxValue: 10,
                    minValue: 0,
                    gapValue: 1,
                    unit: "°C",
                    onChanged: (value) {
                      sharedPrefColdRoom.setAmbTemp(double.parse(value));
                    },
                  ),
                  InputTileOption(
                    title: "RH",
                    options: const [
                      "60 %",
                      "50 %",
                    ],
                    inititalValue: "${sharedPrefsColdRoom.ambRH} %",
                    onChanged: (value) {
                      setState(() {});
                      sharedPrefColdRoom.setAmbRH(value.replaceAll(" %", ""));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 200,
              )
            ],
          ),
        ));
  }
}
