class AirChanges {
  int id;
  bool room_temp;
  double room_volume;
  double air_change;
  double min_value;
  double max_value;
  AirChanges(
    this.id,
    this.room_temp,
    this.room_volume,
    this.air_change,
    this.min_value,
    this.max_value,
  );
}

List<AirChanges> airChangesList = [
  AirChanges(1, false, 200, 33.5, 0, 225),
  AirChanges(2, false, 250, 29, 225, 275),
  AirChanges(3, false, 300, 26.2, 275, 350),
  AirChanges(4, false, 400, 22.5, 350, 450),
  AirChanges(5, false, 500, 20, 450, 550),
  AirChanges(6, false, 600, 18, 550, 700),
  AirChanges(7, false, 800, 15.3, 700, 900),
  AirChanges(8, false, 1000, 13.5, 900, 1250),
  AirChanges(9, false, 1500, 11, 1250, 1750),
  AirChanges(10, false, 2000, 9.3, 1750, 2500),
  AirChanges(11, false, 3000, 7.4, 2500, 3500),
  AirChanges(12, false, 4000, 6.3, 3500, 4500),
  AirChanges(13, false, 5000, 5.6, 4500, 5500),
  AirChanges(14, false, 6000, 5, 5500, 7000),
  AirChanges(15, false, 8000, 4.3, 7000, 9000),
  AirChanges(16, false, 10000, 3.8, 9000, 12500),
  AirChanges(17, false, 15000, 3, 12500, 17500),
  AirChanges(18, false, 20000, 2.6, 17500, 22500),
  AirChanges(19, false, 25000, 2.3, 22500, 27500),
  AirChanges(20, false, 30000, 2.1, 27500, 35000),
  AirChanges(21, false, 40000, 1.8, 35000, 45000),
  AirChanges(22, false, 50000, 1.6, 45000, 62500),
  AirChanges(23, false, 75000, 1.3, 62500, 87500),
  AirChanges(24, false, 100000, 1.1, 87500, 125000),
  AirChanges(25, false, 150000, 1, 125000, 175000),
  AirChanges(26, false, 200000, 0.9, 175000, 250000),
  AirChanges(27, false, 300000, 0.85, 250000, 400000),
  AirChanges(28, false, 500000, 0.75, 400000, 625000),
  AirChanges(29, false, 750000, 0.65, 625000, 875000),
  AirChanges(30, false, 1000000, 0.55, 875000, 1000000000),
  AirChanges(31, true, 200, 44, 0, 225),
  AirChanges(32, true, 250, 39, 225, 275),
  AirChanges(33, true, 300, 34.5, 275, 350),
  AirChanges(34, true, 400, 29.5, 350, 450),
  AirChanges(35, true, 500, 26, 450, 550),
  AirChanges(36, true, 600, 23, 550, 700),
  AirChanges(37, true, 800, 20, 700, 900),
  AirChanges(38, true, 1000, 17.5, 900, 1250),
  AirChanges(39, true, 1500, 14, 1250, 1750),
  AirChanges(40, true, 2000, 12, 1750, 2500),
  AirChanges(41, true, 3000, 9.5, 2500, 3500),
  AirChanges(42, true, 4000, 8.2, 3500, 4500),
  AirChanges(43, true, 5000, 7.2, 4500, 5500),
  AirChanges(44, true, 6000, 6.5, 5500, 7000),
  AirChanges(45, true, 8000, 5.5, 7000, 9000),
  AirChanges(46, true, 10000, 4.9, 9000, 12500),
  AirChanges(47, true, 15000, 3.9, 12500, 17500),
  AirChanges(48, true, 20000, 3.5, 17500, 22500),
  AirChanges(49, true, 25000, 3, 22500, 27500),
  AirChanges(50, true, 30000, 2.7, 27500, 35000),
  AirChanges(51, true, 40000, 2.3, 35000, 45000),
  AirChanges(52, true, 50000, 2, 45000, 62500),
  AirChanges(53, true, 75000, 1.6, 62500, 87500),
  AirChanges(54, true, 100000, 1.4, 87500, 125000),
  AirChanges(55, true, 150000, 1.3, 125000, 175000),
  AirChanges(56, true, 200000, 1.2, 175000, 250000),
  AirChanges(57, true, 300000, 1.1, 250000, 400000),
  AirChanges(58, true, 500000, 1, 400000, 625000),
  AirChanges(59, true, 750000, 0.9, 625000, 875000),
  AirChanges(60, true, 1000000, 0.8, 875000, 1000000000),
];

List<AirChanges> getBetweenAirChangeList({required double internalVolume, required bool temp}) {
  return airChangesList.where((element) {
    if (internalVolume >= element.min_value && internalVolume < element.max_value && temp == element.room_temp) {
      return true;
    } else {
      return false;
    }
  }).toList();
}
