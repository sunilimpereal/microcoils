// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefBlastRoom {
  static SharedPreferences? _sharedPref;
  init() async {
    _sharedPref ??= await SharedPreferences.getInstance();
  }

// name values
//ambient details
  String ExternalWidth = "externalWidth";
  String ExternalLength = "externalLength";
  String ExternalHeight = "externalHeight";
  String RoomLocation = "roomLocation";
  String RoomTemperature = "roomTemperature";
  String RoomRH = "roomRH";
  String InsulationThickness = "insulationThickness";
  String Insulation = "insulation";
  String AmbTemp = "ambTemp";
  String AmbRH = "ambRH";

  // product details
  String ProductFamily = "ProductFamily";
  String ProductProduct = "ProductProduct";
  String QuantityPerBatch = "QuantityPerBatch";
  String ProductIncTemp = "ProductIncTemp";
  String ProductFinalTemp = "ProductFinalTemp";
  String PullDownTime = "PullDownTime";

  // other details
  String DoorOpenFreq = "DoorOpenFreq";
  String TotRatPow = "TotRatPow";
  String SafetyFactor = "SafetyFactor";

  // result screen
  String RoomInternalVolume = "RoomInternalVolume";
  String RespirationHeat = "RespirationHeat";
  String SpecificHeatAboveFreezing = "SpecificHeatAboveFreezing";
  String SpecificHeatBelowFreezing = "SpecificHeatBelowFreezing";
  String FreezingTemp = "FreezingTemp";
  String LatentHeatOFFreezing = "LatentHeatOFFreezing";
  //heat Load results
  String TransmissionLoad = "TransmissionLoad";
  String ProductLoad = "ProductLoad";
  String InfiltrationLoad = "InfiltrationLoad";
  String InternalLoad = "InternalLoad";
  String CompressorOperatingTime = "CompressorOperatingTime";
  String HourlyEqipmentLoad = "HourlyEqipmentLoad";

  // getters

  // ambient getters
  double get externalLength => _sharedPref!.getDouble(ExternalLength) ?? 4.0;
  double get externalWidth => _sharedPref!.getDouble(ExternalWidth) ?? 5.0;
  double get externalHeight => _sharedPref!.getDouble(ExternalHeight) ?? 3.0;
  String get roomLocation => _sharedPref!.getString(RoomLocation) ?? "Outside";
  double get roomTemperature => _sharedPref!.getDouble(RoomTemperature) ?? 2.0;
  String get roomRH => _sharedPref!.getString(RoomRH) ?? "75";
  double get insulationThickness => _sharedPref!.getDouble(InsulationThickness) ?? 80.0;
  String get insulation => _sharedPref!.getString(Insulation) ?? "PUF 40kg/m3";
  double get ambTemp => _sharedPref!.getDouble(AmbTemp) ?? 40.0;
  String get ambRH => _sharedPref!.getString(AmbRH) ?? "60";
  //product getters
  String get productFamily => _sharedPref!.getString(ProductFamily) ?? "";
  String get productProduct => _sharedPref!.getString(ProductProduct) ?? "";
  double get quantityPerBatch => _sharedPref!.getDouble(QuantityPerBatch) ?? 0.0;
  double get productIncTemp => _sharedPref!.getDouble(ProductIncTemp) ?? 0.0;
  double get productFinalTemp => _sharedPref!.getDouble(ProductFinalTemp) ?? 0.0;
  double get pullDownTime => _sharedPref!.getDouble(PullDownTime) ?? 0.0;

  // othe detail getters
  String get doorOpenFreq => _sharedPref!.getString(DoorOpenFreq) ?? "";
  double get totRatPow => _sharedPref!.getDouble(TotRatPow) ?? 0.0;
  double get safetyFactor => _sharedPref!.getDouble(SafetyFactor) ?? 0.0;

  // result getters
  String get roomInternalVolume => _sharedPref!.getString(RoomInternalVolume) ?? "";
  String get respirationHeat => _sharedPref!.getString(RespirationHeat) ?? "";
  String get specificHeatAboveFreezing => _sharedPref!.getString(SpecificHeatAboveFreezing) ?? "";
  String get specificHeatBelowFreezing => _sharedPref!.getString(SpecificHeatBelowFreezing) ?? "";
  String get freezingTemp => _sharedPref!.getString(FreezingTemp) ?? "";
  String get latentHeatOFFreezing => _sharedPref!.getString(LatentHeatOFFreezing) ?? "";
  String get transmissionLoad => _sharedPref!.getString(TransmissionLoad) ?? "";
  String get productLoad => _sharedPref!.getString(ProductLoad) ?? "";
  String get infiltrationLoad => _sharedPref!.getString(InfiltrationLoad) ?? "";
  String get internalLoad => _sharedPref!.getString(InternalLoad) ?? "";
  String get compressorOperatingTime => _sharedPref!.getString(CompressorOperatingTime) ?? "";
  String get hourlyEqipmentLoad => _sharedPref!.getString(HourlyEqipmentLoad) ?? "";

  /// setters
  setExternalWidth(double value) {
    _sharedPref!.setDouble(ExternalWidth, value);
  }

  setExternalLength(double value) {
    _sharedPref!.setDouble(ExternalLength, value);
  }

  setExternalHeight(double value) {
    _sharedPref!.setDouble(ExternalHeight, value);
  }

  setRoomLocation(String value) {
    _sharedPref!.setString(RoomLocation, value);
  }

  setRoomTemperature(double value) {
    _sharedPref!.setDouble(RoomTemperature, value);
  }

  setRoomRH(String value) {
    _sharedPref!.setString(RoomRH, value);
  }

  setInsulationThickness(double value) {
    _sharedPref!.setDouble(InsulationThickness, value);
  }

  setInsulation(String value) {
    _sharedPref!.setString(Insulation, value);
  }

  setAmbTemp(double value) {
    _sharedPref!.setDouble(AmbTemp, value);
  }

  setAmbRH(String value) {
    _sharedPref!.setString(AmbRH, value);
  }

  // product detail setters

  setProductFamily(String value) {
    _sharedPref!.setString(ProductFamily, value);
  }

  setProductProduct(String value) {
    _sharedPref!.setString(ProductProduct, value);
  }

  setQuantityPerBatch(double value) {
    _sharedPref!.setDouble(QuantityPerBatch, value);
  }

  setProductIncTemp(double value) {
    _sharedPref!.setDouble(ProductIncTemp, value);
  }

  setProductFinalTemp(double value) {
    _sharedPref!.setDouble(ProductFinalTemp, value);
  }

  setPullDownTime(double value) {
    _sharedPref!.setDouble(PullDownTime, value);
  }

  //other setters
  setDoorOpenFreq(String value) {
    _sharedPref!.setString(DoorOpenFreq, value);
  }

  setTotRatPow(double value) {
    _sharedPref!.setDouble(TotRatPow, value);
  }

  setSafetyFactor(double value) {
    _sharedPref!.setDouble(SafetyFactor, value);
  }

  //result setters
  setRoomInternalVolume(String value) {
    _sharedPref!.setString(RoomInternalVolume, value);
  }

  setRespirationHeat(String value) {
    _sharedPref!.setString(RespirationHeat, value);
  }

  setSpecificHeatAboveFreezing(String value) {
    _sharedPref!.setString(SpecificHeatAboveFreezing, value);
  }

  setSpecificHeatBelowFreezing(String value) {
    _sharedPref!.setString(SpecificHeatBelowFreezing, value);
  }

  setFreezingTemp(String value) {
    _sharedPref!.setString(FreezingTemp, value);
  }

  setLatentHeatOFFreezing(String value) {
    _sharedPref!.setString(LatentHeatOFFreezing, value);
  }

  setTransmissionLoad(String value) {
    _sharedPref!.setString(TransmissionLoad, value);
  }

  setProductLoad(String value) {
    _sharedPref!.setString(ProductLoad, value);
  }

  setInfiltrationLoad(String value) {
    _sharedPref!.setString(InfiltrationLoad, value);
  }

  setInternalLoad(String value) {
    _sharedPref!.setString(InternalLoad, value);
  }

  setCompressorOperatingTime(String value) {
    _sharedPref!.setString(CompressorOperatingTime, value);
  }

  setHourlyEqipmentLoad(String value) {
    _sharedPref!.setString(HourlyEqipmentLoad, value);
  }
}

final sharedPrefsBlastRoom = SharedPrefBlastRoom();
