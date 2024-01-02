import 'package:microcoils/home/calculator/selector/data/sharedpref_selector.dart';

class SelectorCalculator {
  SharedPrefSelector sharedPref = sharedPrefSelector;

  void setDefaultValues() {
    // Set default values based on the provided information
    sharedPref.setModel("MEP");
    sharedPref.setCapacity(1.08);
    sharedPref.setRefrigerant("R134a");
    sharedPref.setEvaporationTemp(0.0);
    sharedPref.setDT1(5.0);
    sharedPref.setFinSpacing(4.0);
    sharedPref.setRH("96");
    sharedPref.setCondenserTemp(28);
    sharedPref.setDT1(5);
    sharedPref.setDefrosting("Electrical defrost");
  }
}
