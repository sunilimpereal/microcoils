// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import "dart:math" as Math;

import 'package:microcoils/home/calculator/cold%20room%20calculator/data/air_changes.dart';
import 'package:microcoils/home/calculator/cold%20room%20calculator/data/products.dart';
import 'package:microcoils/home/calculator/cold%20room%20calculator/data/sharedpref_coldroom.dart';

import '../../../../main.dart';
import 'bt_upper_cube_feet.dart';

class ColdRoomCalculator {
  SharedPrefColdRoom coldRoom = sharedPrefsColdRoom;
  setDefaultValues() {
    // method to set the default values of the calculator
    //cold room details
    coldRoom.setExternalLength(4);
    coldRoom.setExternalWidth(5);
    coldRoom.setExternalHeight(3);
    coldRoom.setRoomLocation("Outside");
    coldRoom.setRoomTemperature(2);
    coldRoom.setRoomRH("75");
    coldRoom.setInsulationThickness(80);
    coldRoom.setInsulation("PUF 40kg/m\u00B3");

    //ambient details
    coldRoom.setAmbTemp(40);
    coldRoom.setRoomRH("60");

    //product details
    coldRoom.setProductFamily("Vegetables");
    coldRoom.setProductProduct("Vegetables-Mean Value");
    coldRoom.setStorageDensity(275);
    coldRoom.setQuantity(14515);
    coldRoom.setDailyLoadPerc(5);
    coldRoom.setDailyLoading(726);
    coldRoom.setProductIncTemp(30);
    coldRoom.setProductFinalTemp(4);
    coldRoom.setCoolingTime(24);

    //other details
    coldRoom.setDoorOpenFreq("Normal");
    coldRoom.setNoPersons(2);
    coldRoom.setWorkingHrs(5);
    coldRoom.setTotRatPow(1500);
    coldRoom.setMotRunHrs(20);
    coldRoom.setLighting(10);
    coldRoom.setOperatingHrs(6);
    coldRoom.setCompOperatingHrs(20);
    coldRoom.setSafetyFactor(10);
  }

  calculate() {
    double length = coldRoom.externalLength;
    double width = coldRoom.externalWidth;
    double height = coldRoom.externalHeight;
    double ambTemp = coldRoom.ambTemp;
    double roomTemp = coldRoom.roomTemperature;
    String insulation = coldRoom.insulation;
    double insulationThick = coldRoom.insulationThickness;
    String location = coldRoom.roomLocation;
    double roomRH = double.parse(coldRoom.roomRH);
    String ambRH = coldRoom.ambRH;
    double hI = 10;
    double hO = 20;
    //temperature coeff
    double tempCoeff = insulation.contains("PUF") ? 0.023 : 0.027;
    log("calculating cold room");
    log("temp insulation $insulation");
    log("temp coeff $tempCoeff");
    // eff wall temperature
    double effWallTemp = location.toLowerCase() == "outside" ? ambTemp + 4 : ambTemp - 7;
    log("eff wall temp : $effWallTemp");
    double internalVolume =
        (length - (2 * (insulationThick / 1000))) * (width - (2 * (insulationThick / 1000))) * (height - (2 * (insulationThick / 1000)));
    log("internal volume  : $internalVolume");

    double lH = length * height;
    double wH = width * height;
    double lW = length * width;
    double tempDiff = (effWallTemp - roomTemp);
    double fUValue = 1 / ((1 / hI) + ((insulationThick / 1000) / tempCoeff) + (1 / hO));
    double fUValueC = 1 / ((1 / hI) + ((insulationThick / 100) / tempCoeff) + (1 / hO));
    log(" fUValue : $fUValue");

    double outerAreaWallA = (lH * tempDiff * fUValue) / 1000;
    double outerAreaWallB = (wH * tempDiff * fUValue) / 1000;
    double outerAreaWallC = (lH * tempDiff * fUValueC) / 1000;
    double outerAreaWallD = (wH * tempDiff * fUValue) / 1000;
    double outerAreaWallRoof = (lW * tempDiff * fUValue) / 1000;
    double outerAreaWallFloor = (lW * tempDiff * fUValue) / 1000;
    double totalTransmission = outerAreaWallA + outerAreaWallB + outerAreaWallC + outerAreaWallD + outerAreaWallFloor + outerAreaWallRoof;
    log(" totalTransmission : $totalTransmission");

    //product load

    double productQuantity = coldRoom.quantity;
    double prodLoadingPer = coldRoom.dailyLoadPerc; //TODO : CHECK FOR VALUE NOT FOUND IN SCREEN
    double incomeTemp = coldRoom.productIncTemp;
    double finalTemp = coldRoom.productFinalTemp;
    double coolTime = coldRoom.coolingTime;
    String strProduct = coldRoom.productProduct;
    double prodStorageDensity = productQuantity / internalVolume;
    log(" prodStorageDensity : $prodStorageDensity");

    List<Products> product = getProducts(strProduct);
    double sp_heat_above_freez = 0;
    double sp_heat_below_freez = 0;
    double freezTemp = 0;
    double latentHeatFreez = 0;
    double respiration = 0;
    String productFamily = "";
    bool isFreezTempAvailable;
    if (product.length != 0) {
      sp_heat_above_freez = double.parse(product[0].sp_heat_above_freezing);
      sp_heat_below_freez = double.parse(product[0].sp_heat_below_freezing);

      freezTemp = product[0].freezing_temp;
      latentHeatFreez = double.parse(product[0].latent_heat_freez);
      respiration = double.parse(product[0].respiration_heat);
      productFamily = product[0].product_family;
      isFreezTempAvailable = product[0].is_freez_point_available;
    }
    double product_a_value = incomeTemp - freezTemp;
    double product_b_value = incomeTemp - finalTemp;
    double product_c_min = (product_a_value < product_b_value) ? product_a_value : product_b_value;
    double product_c_max = (product_c_min > 0) ? product_c_min : 0;
    double product_d_value = freezTemp - finalTemp;
    double product_e_value = incomeTemp - finalTemp;
    double product_f_min = (product_d_value < product_e_value) ? product_d_value : product_e_value;
    double product_f_max = (product_f_min > 0) ? product_f_min : 0;

    double dailyProductLoading = (productQuantity * prodLoadingPer) / 100;
    double fReezRequireOrNot = 0;

    if (finalTemp < freezTemp && incomeTemp > freezTemp) {
      fReezRequireOrNot = 1;
    }

    double fSenSible_heat_load_above_freez = dailyProductLoading * sp_heat_above_freez * product_c_max;
    double fSenSible_heat_load_below_freez = dailyProductLoading * sp_heat_below_freez * product_f_max;
    double latent_heat_load_freez = dailyProductLoading * latentHeatFreez * fReezRequireOrNot;
    double respiration_heat_load_freez = respiration * productQuantity;
    double product_load_in_kj =
        fSenSible_heat_load_above_freez + fSenSible_heat_load_below_freez + latent_heat_load_freez + respiration_heat_load_freez;
    double product_load_in_kw = product_load_in_kj / (coolTime * 60 * 60);
    log("product_load_in_kw : $product_load_in_kw");
    //// other load ///
    double safteyFac = coldRoom.safetyFactor;
    double nOofPerson = coldRoom.noPersons;
    double lightIrrad = coldRoom.lighting;
    double operaHrs = coldRoom.operatingHrs;
    double motorRunHrs = coldRoom.motRunHrs;
    double workHrs = coldRoom.workingHrs;
    double totalRatPower = coldRoom.totRatPow;
    double compresOperatingHrs = coldRoom.compOperatingHrs;
    String other_door_opert_freq = coldRoom.doorOpenFreq;

    double no_of_air_change = 0;
    bool bool_roomTemp;

    if (roomTemp > 0) {
      bool_roomTemp = true;
    } else {
      bool_roomTemp = false;
    }
    double internal_volume_cubic_feet = (internalVolume * 35.3147);
    List<AirChanges> airChangesList = getBetweenAirChangeList(internalVolume: internal_volume_cubic_feet, temp: bool_roomTemp);
    if (airChangesList.isNotEmpty) {
      for (int i = 0; i < airChangesList.length; i++) {
        no_of_air_change = airChangesList[i].air_change;
        log("air change val $no_of_air_change ");
      }
    }

    //kept as constant need to change

    double other_btu_per_cubic = 0;
    double fAmbRh = double.parse(ambRH);
    List<BTUperCubeFeet> btUperCubeFeetList = [];
    if (fAmbRh == 50 && ambTemp <= 36.4) {
      btUperCubeFeetList = getBtuList(roomTemp, fAmbRh, 35);
      log("calculation:fanmb 1 " " call");
    } else if (fAmbRh == 60 && ambTemp <= 36.4) {
      btUperCubeFeetList = getBtuList(roomTemp, fAmbRh, 35);
      log("calculation:fanmb 2 " " call");
    } else if (fAmbRh == 50 && (36.4 < ambTemp && ambTemp <= 39.24)) {
      btUperCubeFeetList = getBtuList(roomTemp, fAmbRh, 37.8);
      log("calculation:fanmb 3 " " call");
    } else if (fAmbRh == 60 && (36.4 < ambTemp && ambTemp <= 39.24)) {
      btUperCubeFeetList = getBtuList(roomTemp, fAmbRh, 37.8);
      log("calculation:fanmb 4 " " call");
    } else if (fAmbRh == 50 && (ambTemp > 39.2)) {
      btUperCubeFeetList = getBtuList(roomTemp, fAmbRh, 40.6);
      log("calculation:fanmb 5 " " call");
    } else if (fAmbRh == 60 && (ambTemp > 39.2)) {
      log("calculation:  $roomTemp   $fAmbRh   ${40.6}");

      btUperCubeFeetList = getBtuList(roomTemp, fAmbRh, 40.6);
      log("calculation:fanmb 6 " " call");
      log("calculation:fanmb 61 ${btUperCubeFeetList.length}");
    }

    if (btUperCubeFeetList.isNotEmpty) {
      other_btu_per_cubic = btUperCubeFeetList[0].btu_value;
      log("calculation:btUperCubeFeetList.get(0).btu_value  ${btUperCubeFeetList[0].btu_value}");
    }

    double other_door_height = 8;
    double other_door_width = 4;
    double other_door_oprating_time = 0;
    if (roomTemp > 0) {
      other_door_oprating_time = 0.035;
    } else {
      other_door_oprating_time = 0.0228;
    }
    double other_no_doors = 1;

    double other_room_vol = internalVolume * 35.31467;
    double other_room_temp = (roomTemp * 1.8) + 32;
    double other_amb_temp = (ambTemp * 1.8) + 32;

    double other_door_opr_freq_factor = 0;
    if (other_door_opert_freq.toLowerCase() == "light") {
      other_door_opr_freq_factor = 0.6;
    } else if (other_door_opert_freq.toLowerCase() == "normal") {
      other_door_opr_freq_factor = 1;
    } else {
      other_door_opr_freq_factor = 2;
    }

    double fVelocity_air_filteration =
        ((100 * Math.sqrt(other_door_height) / Math.sqrt(7)) * ((Math.sqrt(other_amb_temp - other_room_temp)) / Math.sqrt(60)));

    double fCFM_of_filteration = (fVelocity_air_filteration * other_door_height * other_door_width) / no_of_air_change;

    double btu_per_hr_going_inside_room = fCFM_of_filteration * other_btu_per_cubic * 60;

    double othe_total_heat_filteration =
        (btu_per_hr_going_inside_room / 12000) * 3.52 * other_door_oprating_time * other_no_doors * other_door_opr_freq_factor;

    ///////////////////////////////// intenal load ////////////////////////////////////////
    double heat_dissipate_by_all_worker = nOofPerson * workHrs * (270 - (6 * roomTemp)) / 1000 / 24;
    double fFloorArea = length * width;
    double lightingLoad = (lightIrrad * operaHrs * fFloorArea) / 1000 / 24;
    double fMotorLoad = ((totalRatPower / 1000) * motorRunHrs * 0.0415);
    double fg_fTotalInternalLoad;
    double fTotalInternalLoad = heat_dissipate_by_all_worker + lightingLoad + fMotorLoad;
    fg_fTotalInternalLoad = fTotalInternalLoad;
    double fRefrigrationLoad = totalTransmission + product_load_in_kw + othe_total_heat_filteration + fTotalInternalLoad;
    double dRefrigiration_load_factor = fRefrigrationLoad * ((100 + safteyFac) / 100);
    double hourly_eqipment_load = (dRefrigiration_load_factor * 24) / compresOperatingHrs;

    ////// setting values to shared pref

    Map result = {
      "Room length": "$length m",
      "Room width": "$width m",
      "Room height": "$height m",
      "Insulation thickness": "$insulationThick mm",
      "Wall insulation material": insulation,
      "Room internal volume": "$internalVolume m3",
      "Cold room location": "$location",
      "Room temperature": "$roomTemp C",
      "Room RH": "$roomRH",
      "Door opening frequency": "$other_door_opert_freq",
      //product
      "Product": product,
      "Product Family": productFamily,
      "Product quantity": "$productQuantity",
      "Product storage density": "$prodStorageDensity",
      "Daily product loading": "$dailyProductLoading",
      "Product incoming temp": "$incomeTemp",
      "Product final temp": "$finalTemp",
      "Specific heat above freezing": "$sp_heat_above_freez",
      "Specific heat below freezing": "$sp_heat_below_freez",
      "Freezing temp": "$freezTemp",
      "Latent heat of freezing": "$latentHeatFreez",
      "Respiration heat": "$respiration",
      "No. of workers": "$nOofPerson",
      "Working time": "$workHrs h",
      "Total rated power of all  motors": "$totalRatPower W",
      "Running time": "$motorRunHrs h",
      "Lighting ": "$lightIrrad",
      "Operating time": "$operaHrs h",
      //other
      "Transmission load ": "$totalTransmission kW",
      "Product load ": "$product_load_in_kw kW",
      "Infiltration load": "$othe_total_heat_filteration kW",
      "Internal load": "$fTotalInternalLoad kW",
      "Safety factor": "$safteyFac %",
      "Cooling time": "$coolTime h",
      "Compressor operating time": "$compresOperatingHrs",
      "Hourly equipment load": "$hourly_eqipment_load kW"
    };

    sharedPrefColdRoom.setRoomInternalVolume(internalVolume.toStringAsFixed(2));
    sharedPrefColdRoom.setSpecificHeatAboveFrez(sp_heat_above_freez.toString());
    sharedPrefColdRoom.setSpecificHeatBelowFrez(sp_heat_below_freez.toString());
    sharedPrefColdRoom.setFreezingTemp(freezTemp.toString());
    sharedPrefColdRoom.setLatentHeatOfFreezing(latentHeatFreez.toString());
    sharedPrefColdRoom.setRespirationHeat(respiration.toString());
    sharedPrefColdRoom.setTransmissionLoad(totalTransmission.toStringAsFixed(2));
    sharedPrefColdRoom.setProductLoad(product_load_in_kw.toStringAsFixed(2));
    sharedPrefColdRoom.setInfiltrationLoad(othe_total_heat_filteration.toStringAsFixed(2));
    sharedPrefColdRoom.setInternalLoad(fTotalInternalLoad.toStringAsFixed(2));
    sharedPrefColdRoom.setHourlyEqipmentLoad(hourly_eqipment_load.toStringAsFixed(2));

    return result;
  }
}
