// To parse this JSON data, do
//
//     final locationRequest = locationRequestFromJson(jsonString);

import 'dart:convert';

LocationRequest locationRequestFromJson(String str) =>
    LocationRequest.fromJson(json.decode(str));

String locationRequestToJson(LocationRequest data) =>
    json.encode(data.toJson());

class LocationRequest {
  LocationRequest({
    required this.locationName,
    required this.latitude,
    required this.userId,
    required this.longitude,
  });

  String locationName;
  String latitude;
  String userId;
  String longitude;

  factory LocationRequest.fromJson(Map<String, dynamic> json) =>
      LocationRequest(
        locationName: json["locationName"],
        latitude: json["latitude"],
        userId: json["userId"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "locationName": locationName,
        "latitude": latitude,
        "userId": userId,
        "longitude": longitude,
      };
}
