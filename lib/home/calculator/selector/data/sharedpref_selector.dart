// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSelector {
  static SharedPreferences? _sharedPref;
  init() async {
    _sharedPref ??= await SharedPreferences.getInstance();
  }

// name values
  String UnitType = "unitType";
  String Model = "model";
  String Capacity = "capacity";
  String Refrigerant = "refrigerant";
  String EvaporationTemp = "evaporationTemp";
  String CondenserTemp = "condenserTemp";
  String RH = "rh";
  String DT1 = "dt1";
  String RoomTemp = "roomTemp";
  String FinSpacing = "finSpacing";
  String Defrosting = "defrosting";
  // Getters
  String get unitType => _sharedPref!.getString(UnitType) ?? "";
  String get model => _sharedPref!.getString(Model) ?? "";
  double get capacity => _sharedPref!.getDouble(Capacity) ?? 0;
  String get refrigerant => _sharedPref!.getString(Refrigerant) ?? "";
  double get evaporationTemp => _sharedPref!.getDouble(EvaporationTemp) ?? 0.0;
  double get condenserTemp => _sharedPref!.getDouble(CondenserTemp) ?? 0.0;
  String get rh => _sharedPref!.getString(RH) ?? "96";
  double get dt1 => _sharedPref!.getDouble(DT1) ?? 0.0;
  double get roomTemp => _sharedPref!.getDouble(RoomTemp) ?? 0.0;
  double get finSpacing => _sharedPref!.getDouble(FinSpacing) ?? 0.0;
  String get defrosting => _sharedPref!.getString(Defrosting) ?? "";

  // Setters
  setUnitType(String value) {
    _sharedPref!.setString(UnitType, value);
  }

  setModel(String value) {
    _sharedPref!.setString(Model, value);
  }

  setCapacity(double value) {
    _sharedPref!.setDouble(Capacity, value);
  }

  setRefrigerant(String value) {
    _sharedPref!.setString(Refrigerant, value);
  }

  setEvaporationTemp(double value) {
    _sharedPref!.setDouble(EvaporationTemp, value);
  }

  setCondenserTemp(double value) {
    _sharedPref!.setDouble(CondenserTemp, value);
  }

  setRH(String value) {
    _sharedPref!.setString(RH, value);
  }

  setDT1(double value) {
    _sharedPref!.setDouble(DT1, value);
  }

  setRoomTemp(double value) {
    _sharedPref!.setDouble(RoomTemp, value);
  }

  setFinSpacing(double value) {
    _sharedPref!.setDouble(FinSpacing, value);
  }

  setDefrosting(String value) {
    _sharedPref!.setString(Defrosting, value);
  }
}

final sharedPrefSelector = SharedPrefSelector();
