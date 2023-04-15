import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microcoils/home/calculator/cold%20room%20calculator/data/sharedpref_coldroom.dart';
import 'package:microcoils/home/calculator/cold%20room%20calculator/pdf/cold_room_pdf.dart';
import 'package:microcoils/home/calculator/cold%20room%20calculator/pdf/pdf_input_screen.dart';

import '../../../utils/screen.dart';
import '../../profile/widgets/app_bar.dart';
import '../widgets/summary_box.dart';

class ColdRoomResultScreen extends StatefulWidget {
  const ColdRoomResultScreen({super.key});

  @override
  State<ColdRoomResultScreen> createState() => _ColdRoomResultScreenState();
}

class _ColdRoomResultScreenState extends State<ColdRoomResultScreen> {
  SharedPrefColdRoom coldRoom = sharedPrefsColdRoom;
  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              CustomAppBar(
                title: "Heat Load Summary",
                options: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => PdfInputScreen(
                                  ongeneratePdf: () {
                                    ColdRoomPdf().generatePdf();
                                  },
                                  onSharePdf: () {
                                    ColdRoomPdf().sharePdf();
                                  },
                                )));
                      },
                      icon: const Icon(
                        Icons.print,
                      ))
                ],
              ),
              GestureDetector(
                onLongPressMoveUpdate: (details) {
                  log("message`");
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SummaryBox(title: "Ambient Definition", summaryBoxItems: [
                          SummaryBoxItem(unit: "\u2103", title: "Ambient tempertaure", value: coldRoom.ambTemp.toString()),
                          SummaryBoxItem(unit: "%", title: "Ambient RH", value: coldRoom.ambRH),
                        ]),
                        SummaryBox(title: "Room Definition", summaryBoxItems: [
                          SummaryBoxItem(unit: "m", title: "Room length", value: coldRoom.externalLength.toString()),
                          SummaryBoxItem(unit: "m", title: "Room width", value: coldRoom.externalWidth.toString()),
                          SummaryBoxItem(unit: "m", title: "Room height", value: coldRoom.externalHeight.toString()),
                          SummaryBoxItem(unit: "mm", title: "Insulation Thickness", value: coldRoom.insulationThickness.toString()),
                          SummaryBoxItem(unit: "", title: "Wall insulation material", value: coldRoom.insulation),
                          SummaryBoxItem(unit: "m \u00B3", title: "Room internal Volume", value: coldRoom.roomInternalVolume),
                          SummaryBoxItem(unit: "", title: "Cold Room Location", value: coldRoom.roomLocation),
                          SummaryBoxItem(unit: "\u2103", title: "Room temperature", value: coldRoom.roomTemperature.toString()),
                          SummaryBoxItem(unit: "%", title: "Room RH", value: coldRoom.roomRH.toString()),
                          SummaryBoxItem(unit: "", title: "Door Opening frequeny", value: coldRoom.doorOpenFreq),
                        ]),
                        SummaryBox(title: "Product Definition", summaryBoxItems: [
                          SummaryBoxItem(unit: "", title: "Product", value: coldRoom.productProduct),
                          SummaryBoxItem(unit: "", title: "Product family", value: coldRoom.productFamily),
                          SummaryBoxItem(unit: "kg", title: "Product quantity", value: coldRoom.quantity.toString()),
                          SummaryBoxItem(unit: "kg/m\u00B3 ", title: "Product storage density", value: coldRoom.storageDensity.toString()),
                          SummaryBoxItem(unit: "kg", title: "Daily product loading", value: coldRoom.dailyLoading.toString()),
                          SummaryBoxItem(unit: "\u2103", title: "product incoming temperature", value: coldRoom.productIncTemp.toString()),
                          SummaryBoxItem(unit: "\u2103", title: "Product final temp", value: "${coldRoom.productFinalTemp}"),
                          SummaryBoxItem(unit: "kJ/kg\u2103", title: "Specific heat above freezing", value: coldRoom.specificHeatAboveFrez),
                          SummaryBoxItem(unit: "kJ/kg\u2103", title: "Specific heat below freezing", value: coldRoom.specificHeatBelowFrez),
                          SummaryBoxItem(
                            unit: "\u2103",
                            title: "Freezing temp",
                            value: coldRoom.freezingTemp,
                          ),
                          SummaryBoxItem(
                            unit: "kJ/kg",
                            title: "latent heat of freezing",
                            value: coldRoom.latentHeatOfFreezing,
                          ),
                          SummaryBoxItem(
                            unit: "W/kg*24 h",
                            title: "Respiration heat",
                            value: coldRoom.respirationHeat,
                          ),
                        ]),
                        SummaryBox(title: "Internal Factors", summaryBoxItems: [
                          SummaryBoxItem(unit: "", title: "No. of workers", value: coldRoom.noPersons.toString()),
                          SummaryBoxItem(unit: "h", title: "Working Time", value: coldRoom.workingHrs.toString()),
                          SummaryBoxItem(unit: "kW", title: "Total Rated power Motors", value: coldRoom.totRatPow.toString()),
                          SummaryBoxItem(unit: "h", title: "Running Time", value: coldRoom.motRunHrs.toString()),
                          SummaryBoxItem(unit: "W/m\u2102", title: "Lighting", value: coldRoom.lighting.toString()),
                          SummaryBoxItem(unit: "h", title: "Operating Time", value: coldRoom.operatingHrs.toString()),
                        ]),
                        SummaryBox(title: "Heat Load Results", summaryBoxItems: [
                          SummaryBoxItem(unit: "kW", title: "Transmission Load", value: coldRoom.transmissionLoad),
                          SummaryBoxItem(unit: "kW", title: "Product Load", value: coldRoom.productLoad),
                          SummaryBoxItem(unit: "kW", title: "Infiltration Load", value: coldRoom.infiltrationLoad),
                          SummaryBoxItem(unit: "kW", title: "Internal Load", value: coldRoom.internalLoad.toString()),
                          SummaryBoxItem(unit: "%", title: "Safety factor", value: coldRoom.safetyFactor.toString()),
                          SummaryBoxItem(unit: "h", title: "Cooling time", value: coldRoom.coolingTime.toString()),
                          SummaryBoxItem(unit: "h", title: "Compressor operating time", value: coldRoom.compOperatingHrs.toString()),
                          SummaryBoxItem(unit: "kW", title: "Hourly equipment load", value: coldRoom.hourlyEqipmentLoad),
                        ]),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => PdfInputScreen(
                        ongeneratePdf: () {
                          ColdRoomPdf().generatePdf();
                        },
                        onSharePdf: () {
                          ColdRoomPdf().sharePdf();
                        },
                      )));
            },
            child: const Text("pdf")),
      ),
    );
  }
}
