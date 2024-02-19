import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:microcoils/home/calculator/selector/data/air_cooler_request.dart';
import 'package:microcoils/home/calculator/selector/data/air_cooler_response.dart';
import 'package:microcoils/home/calculator/selector/repository/selector_repository.dart';
import 'package:microcoils/home/calculator/widgets/air_cooler_card.dart';

import 'data/sharedpref_selector.dart';

class AirCoolers extends StatefulWidget {
  const AirCoolers({super.key});

  @override
  State<AirCoolers> createState() => _AirCoolersState();
}

class _AirCoolersState extends State<AirCoolers> {
  AirCoolerResponse? airCoolerResponse;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AirCoolerResponse?>(
        future: SelectorRepository().getAirCoolers(
            airCoolerRequest: AirCoolerRequest(
                capacity: sharedPrefSelector.capacity.toString(),
                conTemp: sharedPrefSelector.condenserTemp.toString(),
                evTemp: sharedPrefSelector.evaporationTemp.toString(),
                finSpacing: sharedPrefSelector.finSpacing.toString(),
                k2Refrigerant: sharedPrefSelector.refrigerant,
                roomTemp: sharedPrefSelector.roomTemp.toString(),
                series: sharedPrefSelector.model,
                tempCorrectionFactor: sharedPrefSelector.dt1.toString())),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return Center(child: Text("No Air Coolers Found"));
          }
          var list = snapshot.data!.filteredEvapoaratorDtoList;
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: list
                    .map((e) => AirCoolerCard(
                          filteredEvapoaratorDtoList: e,
                        ))
                    .toList(),
              ),
            ),
          );
        });
  }
}
