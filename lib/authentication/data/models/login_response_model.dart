// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String? message;
  int? userId;
  User? user;
  int? statusCode;
  String? otp;

  LoginResponse({this.message, this.userId, this.user, this.statusCode, this.otp});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        userId: json["userId"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        statusCode: json["statusCode"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "userId": userId,
        "user": user?.toJson(),
        "statusCode": statusCode,
      };
}

class User {
  dynamic applicationVersion;
  dynamic address;
  dynamic os;
  dynamic companyName;
  int? isActive;
  dynamic deviceId;
  dynamic createdon;
  String? password;
  dynamic osVersion;
  dynamic imageUrl;
  String? contact;
  dynamic socialId;
  dynamic name;
  int? id;
  String? email;

  User({
    this.applicationVersion,
    this.address,
    this.os,
    this.companyName,
    this.isActive,
    this.deviceId,
    this.createdon,
    this.password,
    this.osVersion,
    this.imageUrl,
    this.contact,
    this.socialId,
    this.name,
    this.id,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        applicationVersion: json["applicationVersion"],
        address: json["address"],
        os: json["os"],
        companyName: json["companyName"],
        isActive: json["isActive"],
        deviceId: json["deviceId"],
        createdon: json["createdon"],
        password: json["password"],
        osVersion: json["osVersion"],
        imageUrl: json["imageUrl"],
        contact: json["contact"],
        socialId: json["socialId"],
        name: json["name"],
        id: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "applicationVersion": applicationVersion,
        "address": address,
        "os": os,
        "companyName": companyName,
        "isActive": isActive,
        "deviceId": deviceId,
        "createdon": createdon,
        "password": password,
        "osVersion": osVersion,
        "imageUrl": imageUrl,
        "contact": contact,
        "socialId": socialId,
        "name": name,
        "id": id,
        "email": email,
      };
}
