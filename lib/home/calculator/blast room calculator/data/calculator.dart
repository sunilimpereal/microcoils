// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import "dart:math" as Math;
import 'package:microcoils/home/calculator/blast%20room%20calculator/data/sharedpref_bastroom.dart';

import '../../cold room calculator/data/air_changes.dart';
import '../../cold room calculator/data/bt_upper_cube_feet.dart';
import 'blast_products.dart';

class BlastRoomCalculator {
  SharedPrefBlastRoom blastRoom = sharedPrefsBlastRoom;
  setDefaultValues() {
    //cold room details
    blastRoom.setExternalLength(3.66);
    blastRoom.setExternalWidth(2.44);
    blastRoom.setExternalHeight(3.05);
    blastRoom.setRoomLocation("Inside");
    blastRoom.setRoomTemperature(-40);
    blastRoom.setRoomRH("75");
    blastRoom.setInsulationThickness(150);
    blastRoom.setInsulation("PUF 40kg/m\u00B3");
    //ambient details
    blastRoom.setAmbTemp(40);
    blastRoom.setRoomRH("60");

    //Product Detail
    blastRoom.setProductFamily("Polutry Products");
    blastRoom.setProductProduct("Chicken");
    blastRoom.setQuantityPerBatch(2000);
    blastRoom.setProductIncTemp(4);
    blastRoom.setProductFinalTemp(-18);
    blastRoom.setPullDownTime(8);

    //ohter details
    blastRoom.setDoorOpenFreq("Light");
    blastRoom.setTotRatPow(1000);
    blastRoom.setSafetyFactor(5);
  }

  calculate() {
    double fLength = blastRoom.externalLength;
    double fwidth = blastRoom.externalWidth;
    double fHeight = blastRoom.externalHeight;
    double ambTemp = blastRoom.ambTemp;
    double roomTemp = blastRoom.roomTemperature;
    String strLocation = blastRoom.roomLocation;
    String strInsulation = blastRoom.insulation;
    double fInsulationThick = blastRoom.insulationThickness;
    double fRoomRH = double.parse(blastRoom.roomRH);
    String ambRh = blastRoom.ambRH;

    log("calculationBlast:strLocation $strLocation");

    String fg_ambRH = ambRh;

    double h_i = 10;
    double h_o = 20;
    double temp_coeff;
    double effWallTemp;

    if (strInsulation.contains("PUF")) {
      temp_coeff = 0.023;
    } else {
      temp_coeff = 0.027;
    }

    if (strLocation.toLowerCase() == "outside") {
      effWallTemp = ambTemp + 4;
    } else {
      effWallTemp = ambTemp - 7;
    }

    double internal_volume =
        (fLength - (2 * (fInsulationThick / 1000))) * (fwidth - (2 * (fInsulationThick / 1000))) * (fHeight - (2 * (fInsulationThick / 1000)));
    // double internal_volume = (fLength - (2 * fInsulationThick)) * (fwidth - (2 * (fInsulationThick / 1000))) * (fHeight - (2 * fInsulationThick));

    double f_l_h = fLength * fHeight;
    double f_w_h = fwidth * fHeight;
    double f_l_w = fLength * fwidth;

    double fTempDiff = (effWallTemp - roomTemp);
    double f_U_value = 1 / ((1 / h_i) + ((fInsulationThick / 1000) / temp_coeff) + (1 / h_o));

    double fOuterAreaWall_A = (f_l_h * fTempDiff * f_U_value) / 1000;
    double fOuterAreaWall_B = (f_w_h * fTempDiff * f_U_value) / 1000;
    double fOuterAreaWall_C = (f_l_h * fTempDiff * f_U_value) / 1000;
    double fOuterAreaWall_D = (f_w_h * fTempDiff * f_U_value) / 1000;
    double fOuterAreaWall_Roof = (f_l_w * fTempDiff * f_U_value) / 1000;

    double fOuterAreaWall_Floor = (f_l_w * fTempDiff * f_U_value) / 1000;

    double fTotalTransmission =
        fOuterAreaWall_A + fOuterAreaWall_B + fOuterAreaWall_C + fOuterAreaWall_D + fOuterAreaWall_Roof + fOuterAreaWall_Floor;

    ///// product load
    double fProductQuan = blastRoom.quantityPerBatch; //TODO check
    double fProdStorageDensitys = 0;
    double fProdLoadingPer = 0;
    double fIncomeTemp = blastRoom.productIncTemp;
    double fFinalTemp = blastRoom.productFinalTemp;
    double fCoolTime = blastRoom.pullDownTime;

    String strProduct = blastRoom.productProduct;

    double fProdStorageDensity = fProductQuan / internal_volume;

    List<BlastProduct> product = getBlastProducts(strProduct);

    double sp_heat_above_freez = 0;
    double sp_heat_below_freez = 0;
    double fFreezTemp = 0;
    double fLatentHeatFreez = 0;
    double fRespiration = 0;
    String productFamily = "";

    if (product.isNotEmpty) {
      sp_heat_above_freez = product[0].sp_heat_above_freezing;
      sp_heat_below_freez = product[0].sp_heat_below_freezing;
      fFreezTemp = product[0].freezing_temp;
      fLatentHeatFreez = product[0].latent_heat_freez;
      fRespiration = product[0].respiration_heat;
      productFamily = product[0].product_family;
    }

    double product_a_value = fIncomeTemp - fFreezTemp;
    double product_b_value = fIncomeTemp - fFinalTemp;
    double product_c_min = (product_a_value < product_b_value) ? product_a_value : product_b_value;
    double product_c_max = (product_c_min > 0) ? product_c_min : 0;
    double product_d_value = fFreezTemp - fFinalTemp;
    double product_e_value = fIncomeTemp - fFinalTemp;
    double product_f_min = (product_d_value < product_e_value) ? product_d_value : product_e_value;
    double product_f_max = (product_f_min > 0) ? product_f_min : 0;

    double fDaily_product_loading = (fProductQuan * fProdLoadingPer) / 100;

    double fReezRequireOrNot = 0;

    if (fFinalTemp < fFreezTemp && fIncomeTemp > fFreezTemp) {
      fReezRequireOrNot = 1;
    }

    double fSenSible_heat_load_above_freez = fProductQuan * sp_heat_above_freez * product_c_max;

    double fSenSible_heat_load_below_freez = fProductQuan * sp_heat_below_freez * product_f_max;

    double latent_heat_load_freez = fProductQuan * fLatentHeatFreez * fReezRequireOrNot;

    double respiration_heat_load_freez = fRespiration * fProductQuan;

    double product_load_in_kj =
        fSenSible_heat_load_above_freez + fSenSible_heat_load_below_freez + latent_heat_load_freez + respiration_heat_load_freez;

    double product_load_in_kw = product_load_in_kj / (fCoolTime * 60 * 60);

    /////////       other load
    String strSafteyFac = blastRoom.safetyFactor.toString();

    double fSafteyFac = blastRoom.safetyFactor;
    String other_door_opert_freq = blastRoom.doorOpenFreq;

    double no_of_air_change = 0;
    bool bool_roomTemp;

    if (roomTemp > 0) {
      bool_roomTemp = true;
    } else {
      bool_roomTemp = false;
    }

    double internal_volume_cubic_feet = (internal_volume * 35.3147);

    List<AirChanges> airChangesList = getBetweenAirChangeList(internalVolume: internal_volume_cubic_feet, temp: bool_roomTemp);

    if (airChangesList.isNotEmpty) {
      for (int i = 0; i < airChangesList.length; i++) {
        no_of_air_change = airChangesList[i].air_change;
      }
    }

    // kept as constant need to change

    double other_btu_per_cubic = 0;
    double fAmbRh = double.parse(blastRoom.ambRH);
    List<BTUperCubeFeet> btUperCubeFeetList = [];

    if (fAmbRh == 50 && ambTemp <= 36.4) {
      btUperCubeFeetList = getBtuList(roomTemp, fAmbRh, 35);
    } else if (fAmbRh == 60 && ambTemp <= 36.4) {
      btUperCubeFeetList = getBtuList(roomTemp, fAmbRh, 35);
    } else if (fAmbRh == 50 && (36.4 < ambTemp && ambTemp <= 39.24)) {
      btUperCubeFeetList = getBtuList(roomTemp, fAmbRh, 37.8);
    } else if (fAmbRh == 60 && (36.4 < ambTemp && ambTemp <= 39.24)) {
      btUperCubeFeetList = getBtuList(roomTemp, fAmbRh, 37.8);
    } else if (fAmbRh == 50 && (ambTemp > 39.2)) {
      btUperCubeFeetList = getBtuList(roomTemp, fAmbRh, 40.6);
    } else if (fAmbRh == 60 && (ambTemp > 39.2)) {
      btUperCubeFeetList = getBtuList(roomTemp, fAmbRh, 40.6);
    }

    if (btUperCubeFeetList.isNotEmpty) {
      other_btu_per_cubic = btUperCubeFeetList[0].btu_value;
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

    double other_room_vol = internal_volume * 35.31467;
    double other_room_temp = (roomTemp * 1.8) + 32;
    double other_amb_temp = (ambTemp * 1.8) + 32;

    double other_door_opr_freq_factor = 0;

    if (other_door_opert_freq.toLowerCase() == "light") {
      other_door_opr_freq_factor = 0.6;
    } else if (other_door_opert_freq.toLowerCase() == ("normal")) {
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

    ////    internal Load

    double fg_fTotalRatPower = blastRoom.totRatPow;
    double fMotorLoad = ((fg_fTotalRatPower / 1000) * fCoolTime * 0.0415);
    double fTotalInternalLoad = othe_total_heat_filteration + fMotorLoad;
    double fRefrigrationLoad = fTotalTransmission + product_load_in_kw + fTotalInternalLoad;
    double hourly_eqipment_load = (fRefrigrationLoad) * ((100 + fSafteyFac) / 100);

    // setting to sharedpref blastRoom

    blastRoom.setRoomInternalVolume(internal_volume.toStringAsFixed(2));
    blastRoom.setRespirationHeat(fRespiration.toStringAsFixed(2));
    blastRoom.setSpecificHeatAboveFreezing(sp_heat_above_freez.toString());
    blastRoom.setSpecificHeatBelowFreezing(sp_heat_below_freez.toString());
    blastRoom.setFreezingTemp(fFreezTemp.toString());
    blastRoom.setLatentHeatOFFreezing(fLatentHeatFreez.toString());
    blastRoom.setTransmissionLoad(fTotalTransmission.toStringAsFixed(2));
    blastRoom.setProductLoad(product_load_in_kw.toStringAsFixed(2));
    blastRoom.setInfiltrationLoad(fTotalInternalLoad.toStringAsFixed(2));
    blastRoom.setSafetyFactor(fSafteyFac);
    blastRoom.setHourlyEqipmentLoad(hourly_eqipment_load.toStringAsFixed(2));
  }
}
