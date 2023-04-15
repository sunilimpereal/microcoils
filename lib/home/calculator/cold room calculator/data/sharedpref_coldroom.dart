// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefColdRoom {
  static SharedPreferences? _sharedPref;
  init() async {
    _sharedPref ??= await SharedPreferences.getInstance();
  }

  // name values
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
  String ProductFamily = "ProductFamily";
  String ProductProduct = "ProductProduct";
  String StorageDensity = "StorageDensity";
  String Quantity = "Quantity";
  String DailyLoadPerc = "DailyLoadPerc";
  String DailyLoading = "DailyLoading";
  String ProductIncTemp = "ProductIncTemp";
  String ProductFinalTemp = "ProductFinalTemp";
  String CoolingTime = "CoolingTime";

  //other details
  String DoorOpenFreq = "DoorOpenFreq";
  String NoPersons = "NoPersons";
  String WorkingHrs = "WorkingHrs";
  String TotRatPow = "TotRatPow";
  String MotRunHrs = "MotRunHrs";
  String Lighting = "Lighting";
  String OperatingHrs = "OperatingHrs";
  String CompOperatingHrs = "CompOperatingHrs";
  String SafetyFactor = "SafetyFactor";

  // result Screen
  String RoomInternalVolume = "RoomInternalVolume";
  String SpecificHeatAboveFrez = "SpecificHeatAboveFrez";
  String SpecificHeatBelowFrez = "SpecificHeatBelowFrez";
  String FreezingTemp = "FreezingTemp";
  String LatentHeatOfFreezing = "LatentHeatOfFreezing";
  String RespirationHeat = "RespirationHeat";
  // heat load results
  String TransmissionLoad = "TransmissionLoad";
  String ProductLoad = "ProductLoad";
  String InfiltrationLoad = "InfiltrationLoad";
  String InternalLoad = "InternalLoad";
  String CompressorOperatingTime = "CompressorOperatingTime";
  String HourlyEqipmentLoad = "HourlyEqipmentLoad";

  //getters
  //cold room getter
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
  //product detail getters
  String get productFamily => _sharedPref!.getString(ProductFamily) ?? "Vegetables";
  String get productProduct => _sharedPref!.getString(ProductProduct) ?? "Vegetables-Mean";
  double get storageDensity => _sharedPref!.getDouble(StorageDensity) ?? 275;
  double get quantity => _sharedPref!.getDouble(Quantity) ?? 14515;
  double get dailyLoadPerc => _sharedPref!.getDouble(DailyLoadPerc) ?? 5;
  double get dailyLoading => _sharedPref!.getDouble(DailyLoading) ?? 726;
  double get productIncTemp => _sharedPref!.getDouble(ProductIncTemp) ?? 30.0;
  double get productFinalTemp => _sharedPref!.getDouble(ProductFinalTemp) ?? 4.0;
  double get coolingTime => _sharedPref!.getDouble(CoolingTime) ?? 24;
  //other detail gettters
  String get doorOpenFreq => _sharedPref!.getString(DoorOpenFreq) ?? "Normal";
  double get noPersons => _sharedPref!.getDouble(NoPersons) ?? 2;
  double get workingHrs => _sharedPref!.getDouble(WorkingHrs) ?? 5;
  double get totRatPow => _sharedPref!.getDouble(TotRatPow) ?? 1500;
  double get motRunHrs => _sharedPref!.getDouble(MotRunHrs) ?? 20;
  double get lighting => _sharedPref!.getDouble(Lighting) ?? 10;
  double get operatingHrs => _sharedPref!.getDouble(OperatingHrs) ?? 6;
  double get compOperatingHrs => _sharedPref!.getDouble(CompOperatingHrs) ?? 20;
  double get safetyFactor => _sharedPref!.getDouble(SafetyFactor) ?? 10;

  // result screen getters
  String get roomInternalVolume => _sharedPref!.getString(RoomInternalVolume) ?? "";
  String get specificHeatAboveFrez => _sharedPref!.getString(SpecificHeatAboveFrez) ?? "";
  String get specificHeatBelowFrez => _sharedPref!.getString(SpecificHeatBelowFrez) ?? "";
  String get freezingTemp => _sharedPref!.getString(FreezingTemp) ?? "";
  String get latentHeatOfFreezing => _sharedPref!.getString(LatentHeatOfFreezing) ?? "";
  String get respirationHeat => _sharedPref!.getString(RespirationHeat) ?? "";
  String get transmissionLoad => _sharedPref!.getString(TransmissionLoad) ?? "";
  String get productLoad => _sharedPref!.getString(ProductLoad) ?? "";
  String get infiltrationLoad => _sharedPref!.getString(InfiltrationLoad) ?? "";
  String get internalLoad => _sharedPref!.getString(InternalLoad) ?? "";
  String get compressorOperatingTime => _sharedPref!.getString(CompressorOperatingTime) ?? "";
  String get hourlyEqipmentLoad => _sharedPref!.getString(HourlyEqipmentLoad) ?? "";

  //setters
  //cold room setters
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

  //product detail setters
  setProductFamily(String value) {
    _sharedPref!.setString(ProductFamily, value);
  }

  setProductProduct(String value) {
    _sharedPref!.setString(ProductProduct, value);
  }

  setStorageDensity(double value) {
    _sharedPref!.setDouble(StorageDensity, value);
  }

  setQuantity(double value) {
    _sharedPref!.setDouble(Quantity, value);
  }

  setDailyLoadPerc(double value) {
    _sharedPref!.setDouble(DailyLoadPerc, value);
  }

  setDailyLoading(double value) {
    _sharedPref!.setDouble(DailyLoading, value);
  }

  setProductIncTemp(double value) {
    _sharedPref!.setDouble(ProductIncTemp, value);
  }

  setProductFinalTemp(double value) {
    _sharedPref!.setDouble(ProductFinalTemp, value);
  }

  setCoolingTime(double value) {
    _sharedPref!.setDouble(CoolingTime, value);
  }

  //other detail setters
  setDoorOpenFreq(String value) {
    _sharedPref!.setString(DoorOpenFreq, value);
  }

  setNoPersons(double value) {
    _sharedPref!.setDouble(NoPersons, value);
  }

  setWorkingHrs(double value) {
    _sharedPref!.setDouble(WorkingHrs, value);
  }

  setTotRatPow(double value) {
    _sharedPref!.setDouble(TotRatPow, value);
  }

  setMotRunHrs(double value) {
    _sharedPref!.setDouble(MotRunHrs, value);
  }

  setLighting(double value) {
    _sharedPref!.setDouble(Lighting, value);
  }

  setOperatingHrs(double value) {
    _sharedPref!.setDouble(OperatingHrs, value);
  }

  setCompOperatingHrs(double value) {
    _sharedPref!.setDouble(CompOperatingHrs, value);
  }

  setSafetyFactor(double value) {
    _sharedPref!.setDouble(SafetyFactor, value);
  }

  //result Screen setters
  setRoomInternalVolume(String value) {
    _sharedPref!.setString(RoomInternalVolume, value);
  }

  setSpecificHeatAboveFrez(String value) {
    _sharedPref!.setString(SpecificHeatAboveFrez, value);
  }

  setSpecificHeatBelowFrez(String value) {
    _sharedPref!.setString(SpecificHeatBelowFrez, value);
  }

  setFreezingTemp(String value) {
    _sharedPref!.setString(FreezingTemp, value);
  }

  setLatentHeatOfFreezing(String value) {
    _sharedPref!.setString(LatentHeatOfFreezing, value);
  }

  setRespirationHeat(String value) {
    _sharedPref!.setString(RespirationHeat, value);
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

final sharedPrefsColdRoom = SharedPrefColdRoom();
