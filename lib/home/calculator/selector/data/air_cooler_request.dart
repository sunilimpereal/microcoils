// To parse this JSON data, do
//
//     final airCoolerRequest = airCoolerRequestFromJson(jsonString);

import 'dart:convert';

AirCoolerRequest airCoolerRequestFromJson(String str) =>
    AirCoolerRequest.fromJson(json.decode(str));

String airCoolerRequestToJson(AirCoolerRequest data) => json.encode(data.toJson());

class AirCoolerRequest {
  String capacity;
  String conTemp;
  String evTemp;
  String finSpacing;
  String k2Refrigerant;
  String roomTemp;
  String series;
  String tempCorrectionFactor;

  AirCoolerRequest({
    required this.capacity,
    required this.conTemp,
    required this.evTemp,
    required this.finSpacing,
    required this.k2Refrigerant,
    required this.roomTemp,
    required this.series,
    required this.tempCorrectionFactor,
  });

  factory AirCoolerRequest.fromJson(Map<String, dynamic> json) => AirCoolerRequest(
        capacity: json["capacity"],
        conTemp: json["conTemp"],
        evTemp: json["evTemp"],
        finSpacing: json["finSpacing"],
        k2Refrigerant: json["k2Refrigerant"],
        roomTemp: json["roomTemp"],
        series: json["series"],
        tempCorrectionFactor: json["tempCorrectionFactor"],
      );

  Map<String, dynamic> toJson() => {
        "capacity": capacity,
        "conTemp": conTemp,
        "evTemp": evTemp,
        "finSpacing": finSpacing,
        "k2Refrigerant": k2Refrigerant,
        "roomTemp": roomTemp,
        "series": series,
        "tempCorrectionFactor": tempCorrectionFactor,
      };
}
