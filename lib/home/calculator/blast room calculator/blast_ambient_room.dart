import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../widgets/form_section.dart';
import '../widgets/input_tile_number.dart';
import '../widgets/input_tile_option.dart';
import 'data/sharedpref_bastroom.dart';

class BlastAmbientRoomForm extends StatefulWidget {
  const BlastAmbientRoomForm({super.key});

  @override
  State<BlastAmbientRoomForm> createState() => _BlastAmbientRoomFormState();
}

class _BlastAmbientRoomFormState extends State<BlastAmbientRoomForm> {
  SharedPrefBlastRoom blastRoom = sharedPrefsBlastRoom;
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
                    initialValue: blastRoom.externalLength,
                    maxValue: 10,
                    minValue: 0,
                    gapValue: 1,
                    unit: "m",
                    onChanged: (value) {
                      sharedPrefsBlastRoom.setExternalLength(double.parse(value));
                    },
                  ),
                  InputTileNumber(
                    title: "External Width",
                    initialValue: sharedPrefsBlastRoom.externalWidth,
                    maxValue: 10,
                    minValue: 0,
                    gapValue: 1,
                    unit: "m",
                    onChanged: (value) {
                      sharedPrefsBlastRoom.setExternalWidth(double.parse(value));
                    },
                  ),
                  InputTileNumber(
                    title: "External Height",
                    initialValue: sharedPrefsBlastRoom.externalHeight,
                    maxValue: 10,
                    minValue: 0,
                    gapValue: 1,
                    unit: "m",
                    onChanged: (value) {
                      sharedPrefsBlastRoom.setExternalHeight(double.parse(value));
                    },
                  ),
                  InputTileOption(
                    title: "Room Location",
                    options: const [
                      "Outside",
                      "Inside",
                    ],
                    inititalValue: sharedPrefsBlastRoom.roomLocation,
                    onChanged: (value) {
                      sharedPrefsBlastRoom.setRoomLocation(value);
                    },
                  ),
                  InputTileNumber(
                    title: "Room Temperature",
                    initialValue: sharedPrefsBlastRoom.roomTemperature,
                    maxValue: 100,
                    minValue: 0,
                    gapValue: 1,
                    unit: "°C",
                    onChanged: (value) {
                      sharedPrefsBlastRoom.setRoomTemperature(double.parse(value));
                    },
                  ),
                  InputTileNumber(
                    title: "Room RH",
                    initialValue: double.parse(sharedPrefsBlastRoom.roomRH),
                    maxValue: 100,
                    minValue: 0,
                    gapValue: 1,
                    unit: "%",
                    onChanged: (value) {
                      sharedPrefsBlastRoom.setRoomRH(value);
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
                    inititalValue: "${sharedPrefsBlastRoom.insulationThickness.toInt()} mm",
                    onChanged: (value) {
                      sharedPrefsBlastRoom.setInsulationThickness(double.parse(value.replaceAll(" mm", "")));
                    },
                  ),
                  InputTileOption(
                    title: "Insulation",
                    options: const [
                      "PUF 40kg/m\u00B3",
                      "PS 56kg/m\u00B3",
                      "PS 56kg/m\u00B3",
                    ],
                    inititalValue: sharedPrefBlastRoom.insulation,
                    onChanged: (value) {
                      sharedPrefsBlastRoom.setInsulation(value);
                    },
                  ),
                ],
              ),
              FormSection(
                title: "Ambient Details",
                formItems: [
                  InputTileNumber(
                    title: "Ambient Temperature",
                    initialValue: sharedPrefsBlastRoom.ambTemp,
                    maxValue: 10,
                    minValue: 0,
                    gapValue: 1,
                    unit: "°C",
                    onChanged: (value) {
                      sharedPrefsBlastRoom.setAmbTemp(double.parse(value));
                    },
                  ),
                  InputTileOption(
                    title: "RH",
                    options: const [
                      "60 %",
                      "50 %",
                    ],
                    inititalValue: "${sharedPrefsBlastRoom.ambRH} %",
                    onChanged: (value) {
                      sharedPrefsBlastRoom.setAmbRH(value.replaceAll(" %", ""));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ));
  }
}
