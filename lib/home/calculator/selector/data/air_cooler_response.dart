// To parse this JSON data, do
//
//     final airCoolerResponse = airCoolerResponseFromJson(jsonString);

import 'dart:convert';

AirCoolerResponse airCoolerResponseFromJson(String str) =>
    AirCoolerResponse.fromJson(json.decode(str));

String airCoolerResponseToJson(AirCoolerResponse data) => json.encode(data.toJson());

class AirCoolerResponse {
  List<FilteredEvapoaratorDtoList> filteredEvapoaratorDtoList;

  AirCoolerResponse({
    required this.filteredEvapoaratorDtoList,
  });

  factory AirCoolerResponse.fromJson(Map<String, dynamic> json) => AirCoolerResponse(
        filteredEvapoaratorDtoList: List<FilteredEvapoaratorDtoList>.from(
            json["filteredEvapoaratorDtoList"].map((x) => FilteredEvapoaratorDtoList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "filteredEvapoaratorDtoList":
            List<dynamic>.from(filteredEvapoaratorDtoList.map((x) => x.toJson())),
      };
}

class FilteredEvapoaratorDtoList {
  String series;
  String model;
  double finSpacing;
  double actulCapacity;
  double airFlow;
  double airThrow;
  String fan;
  String finMaterial;
  String voltage;
  double fanpower;
  double surfaceArea;
  double tubeVolume;
  String refrigerantInlet;
  String refrigerantOutlet;
  String tubeMaterial;
  double a;
  double b;
  double c;
  double d;
  double e;
  double f;
  double g;
  double h;
  double h1;
  double h2;
  String k2Refrigerant;
  double evTemp;
  double tempCorrectionFactor;
  String evImg;

  FilteredEvapoaratorDtoList({
    required this.series,
    required this.model,
    required this.finSpacing,
    required this.actulCapacity,
    required this.airFlow,
    required this.airThrow,
    required this.fan,
    required this.finMaterial,
    required this.voltage,
    required this.fanpower,
    required this.surfaceArea,
    required this.tubeVolume,
    required this.refrigerantInlet,
    required this.refrigerantOutlet,
    required this.tubeMaterial,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.e,
    required this.f,
    required this.g,
    required this.h,
    required this.h1,
    required this.h2,
    required this.k2Refrigerant,
    required this.evTemp,
    required this.tempCorrectionFactor,
    required this.evImg,
  });

  factory FilteredEvapoaratorDtoList.fromJson(Map<String, dynamic> json) =>
      FilteredEvapoaratorDtoList(
        series: json["series"],
        model: json["model"],
        finSpacing: json["finSpacing"],
        actulCapacity: json["actulCapacity"]?.toDouble(),
        airFlow: json["airFlow"],
        airThrow: json["airThrow"],
        fan: json["fan"],
        finMaterial: json["finMaterial"],
        voltage: json["voltage"],
        fanpower: json["fanpower"],
        surfaceArea: json["surfaceArea"],
        tubeVolume: json["tubeVolume"]?.toDouble(),
        refrigerantInlet: json["refrigerantInlet"],
        refrigerantOutlet: json["refrigerantOutlet"],
        tubeMaterial: json["tubeMaterial"],
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
        e: json["e"],
        f: json["f"],
        g: json["g"],
        h: json["h"],
        h1: json["h1"],
        h2: json["h2"],
        k2Refrigerant: json["k2Refrigerant"],
        evTemp: json["evTemp"],
        tempCorrectionFactor: json["tempCorrectionFactor"],
        evImg: json["evImg"],
      );

  Map<String, dynamic> toJson() => {
        "series": series,
        "model": model,
        "finSpacing": finSpacing,
        "actulCapacity": actulCapacity,
        "airFlow": airFlow,
        "airThrow": airThrow,
        "fan": fan,
        "finMaterial": finMaterial,
        "voltage": voltage,
        "fanpower": fanpower,
        "surfaceArea": surfaceArea,
        "tubeVolume": tubeVolume,
        "refrigerantInlet": refrigerantInlet,
        "refrigerantOutlet": refrigerantOutlet,
        "tubeMaterial": tubeMaterial,
        "a": a,
        "b": b,
        "c": c,
        "d": d,
        "e": e,
        "f": f,
        "g": g,
        "h": h,
        "h1": h1,
        "h2": h2,
        "k2Refrigerant": k2Refrigerant,
        "evTemp": evTemp,
        "tempCorrectionFactor": tempCorrectionFactor,
        "evImg": evImg,
      };
}
