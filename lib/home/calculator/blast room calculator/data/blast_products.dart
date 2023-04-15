class BlastProduct {
  int id;
  String product_name;
  String product_family;
  double respiration_heat;
  double sp_heat_above_freezing;
  double sp_heat_below_freezing;
  double freezing_temp;
  double latent_heat_freez;
  double str_loading_density;
  BlastProduct(
    this.id,
    this.product_family,
    this.product_name,
    this.freezing_temp,
    this.sp_heat_above_freezing,
    this.sp_heat_below_freezing,
    this.latent_heat_freez,
    this.respiration_heat,
    this.str_loading_density,
  );
}

List<BlastProduct> blastProductlist = [
  BlastProduct(1, "Vegetables", "Beans, snap", -0.70, 3.99, 1.85, 302, 0.103, 275),
  BlastProduct(2, "Vegetables", "Beetroot", -1.10, 3.91, 1.94, 293, 0.02125, 275),
  BlastProduct(3, "Vegetables", "Broccoli", -0.60, 4.01, 1.82, 303, 0.25, 275),
  BlastProduct(4, "Vegetables", "Cabbage", -0.90, 4.02, 1.85, 308, 0.06, 275),
  BlastProduct(5, "Vegetables", "Carrots", -1.40, 3.92, 2, 293, 0.057, 275),
  BlastProduct(6, "Vegetables", "Cauliflower", -0.80, 4.02, 1.84, 307, 0.08125, 275),
  BlastProduct(7, "Vegetables", "Corn, sweet, yellow", -0.60, 3.62, 1.98, 254, 0.23, 275),
  BlastProduct(8, "Vegetables", "Cucumbers", -0.50, 4.09, 1.71, 321, 0.085, 275),
  BlastProduct(9, "Vegetables", "Garlic", -0.80, 3.17, 2.19, 196, 0.0283333, 275),
  BlastProduct(10, "Vegetables", "Ginger, root", -0.80, 3.75, 1.94, 273, 0.1070833, 275),
  BlastProduct(11, "Vegetables", "Lettuce, iceberg", -0.20, 4.09, 1.65, 320, 0.065, 275),
  BlastProduct(12, "Vegetables", "Mushrooms", -0.90, 3.99, 1.84, 307, 0.2104166, 200),
  BlastProduct(13, "Vegetables", "Onions", -0.90, 3.95, 1.87, 300, 0.2, 275),
  BlastProduct(14, "Vegetables", "Peas, green", -0.60, 3.75, 1.98, 263, 0.2258333333, 275),
  BlastProduct(15, "Vegetables", "Potatoes, main crop", -0.60, 3.67, 1.93, 264, 0.02, 275),
  BlastProduct(16, "Vegetables", "Pumpkins", -0.80, 3.97, 1.81, 306, 0, 275),
  BlastProduct(17, "Vegetables", "Radishes", -0.70, 4.08, 1.77, 317, 0.0558333, 275),
  BlastProduct(18, "Vegetables", "Spinach", -0.30, 4.02, 1.75, 306, 0.1, 200),
  BlastProduct(19, "Vegetables", "Tomatoes, mature green", -0.60, 4.02, 1.77, 311, 0.06, 275),
  BlastProduct(20, "Vegetables", "Mean Value", -0.9, 3.7, 1.85, 274, 0.05625, 275),
  BlastProduct(21, "Fruits", "Apples, fresh", -1.1, 3.81, 1.98, 280, 0.03, 275),
  BlastProduct(22, "Fruits", "Bananas", -0.8, 3.56, 2.03, 248, 0.165, 275),
  BlastProduct(23, "Fruits", "Cherries, sweet", -1.8, 3.73, 2.12, 270, 0.04166666, 275),
  BlastProduct(24, "Fruits", "Dates, cured", -15.7, 2.31, 2.3, 75, 0, 275),
  BlastProduct(25, "Fruits", "Figs, dried", -2.4, 2.51, 4.13, 95, 0.039166666, 275),
  BlastProduct(26, "Fruits", "Grapefruit", -1.1, 3.96, 1.89, 304, 0.0158333, 275),
  BlastProduct(27, "Fruits", "Mangos", -0.9, 3.74, 1.95, 273, 0.13291666666, 275),
  BlastProduct(28, "Fruits", "Watermelon", -0.4, 3.97, 1.74, 306, 0.022083333, 275),
  BlastProduct(29, "Fruits", "Oranges", -0.8, 3.81, 1.96, 275, 0.019, 275),
  BlastProduct(30, "Fruits", "Pears", -1.6, 3.8, 2.06, 280, 0.040, 275),
  BlastProduct(31, "Fruits", "Pineapples", -1, 3.85, 1.91, 289, 0.165, 275),
  BlastProduct(32, "Fruits", "Raisins, seedless", -2.4, 2.07, 2.04, 52, 0.000, 275),
  BlastProduct(33, "Fruits", "Strawberries", -0.8, 4, 1.84, 306, 0.046, 275),
  BlastProduct(34, "Fruits", "Mean Value", -1.2, 3.47, 1.79, 258, 0.045, 275),
  BlastProduct(35, "Fish", "Cod", -2.2, 3.78, 2.14, 271, 0, 275),
  BlastProduct(36, "Fish", "Haddock", -2.2, 3.75, 2.14, 267, 0, 275),
  BlastProduct(37, "Fish", "Halibut", -2.2, 3.74, 2.18, 260, 0, 275),
  BlastProduct(38, "Fish", "Herring, kippered", -2.2, 3.26, 2.27, 199, 0, 275),
  BlastProduct(39, "Fish", "Mackerel, Atlantic", -2.2, 3.33, 2.23, 212, 0, 275),
  BlastProduct(40, "Fish", "Perch", -2.2, 3.71, 2.15, 263, 0, 275),
  BlastProduct(41, "Fish", "Pollock, Atlantic", -2.2, 3.7, 2.15, 261, 0, 275),
  BlastProduct(42, "Fish", "Salmon, pink", -2.2, 3.68, 2.17, 255, 0, 275),
  BlastProduct(43, "Fish", "Tuna, bluefin", -2.2, 3.43, 2.19, 227, 0, 275),
  BlastProduct(44, "Fish", "Whiting", -2.2, 3.77, 2.15, 268, 0, 275),
  BlastProduct(45, "Fish", "ShellFish, Clams", -2.2, 3.76, 2.13, 273, 0, 275),
  BlastProduct(46, "Fish", "Shellfish Lobster, American", -2.2, 3.64, 2.15, 256, 0, 275),
  BlastProduct(47, "Fish", "Shellfish Oysters", -2.2, 3.83, 2.12, 284, 0, 275),
  BlastProduct(48, "Fish", "Shellfish Scallop, meat", -2.2, 3.71, 2.15, 262, 0, 275),
  BlastProduct(49, "Fish", "Shellfish Shrimp", -2.2, 3.65, 2.16, 253, 0, 275),
  BlastProduct(50, "Meat Products", "Beef Carcass, choice", -2.2, 3.24, 2.31, 191, 0, 275),
  BlastProduct(51, "Meat Products", "Beef select", -1.7, 3.25, 2.24, 194, 0, 275),
  BlastProduct(52, "Meat Products", "Beef Liver", -1.7, 3.47, 2.16, 230, 0, 275),
  BlastProduct(53, "Meat Products", "Beef Sirloin, lean", -1.7, 3.53, 2.11, 239, 0, 275),
  BlastProduct(54, "Meat Products", "Pork Shoulder, whole, lean", -2.2, 3.59, 2.2, 243, 0, 275),
  BlastProduct(55, "Meat Products", "Lamb Composite of cuts, lean", -1.9, 3.6, 2.14, 245, 0, 275),
  BlastProduct(56, "Poultry Products", "Chicken", -2.8, 4.34, 3.32, 220, 0, 275),
  BlastProduct(57, "Poultry Products", "Duck", -2.8, 3.06, 2.45, 162, 0, 275),
  BlastProduct(58, "Poultry Products", "Turkey", -2.8, 3.53, 2.28, 235, 0, 275),
  BlastProduct(59, "Poultry Products", "Egg White", -0.6, 3.91, 1.81, 293, 0, 275),
  BlastProduct(60, "Poultry Products", "Egg Whole", -0.6, 3.63, 1.95, 252, 0, 275),
  BlastProduct(61, "Poultry Products", "Egg Yolk", -0.6, 3.05, 2.25, 163, 0, 275),
  BlastProduct(62, "Dairy Products", "Butter", -0.5, 2.4, 2.65, 60, 0, 275),
  BlastProduct(63, "Dairy Products", "Cheese Cheddar", -12.9, 2.77, 3.07, 123, 0, 275),
  BlastProduct(64, "Dairy Products", "Cheese Cottage, uncreamed", -1.2, 3.73, 1.99, 266, 0, 275),
  BlastProduct(65, "Dairy Products", "Cheese Limburger", -7.4, 3.03, 2.82, 162, 0, 275),
  BlastProduct(66, "Dairy Products", "Cheese Processed American", -6.9, 2.8, 2.75, 131, 0, 275),
  BlastProduct(67, "Dairy Products", "Cheese Roquefort", -16.3, 2.8, 3.36, 132, 0, 275),
  BlastProduct(68, "Dairy Products", "Cheese Swiss", -10, 2.78, 2.88, 124, 0, 275),
  BlastProduct(69, "Dairy Products", "Cream Table", -2.2, 3.59, 2.21, 246, 0, 275),
  BlastProduct(70, "Dairy Products", "Ice Cream Chocolate", -5.6, 3.11, 2.75, 186, 0, 275),
  BlastProduct(71, "Dairy Products", "Ice Cream Strawberry", -5.6, 3.19, 2.74, 200, 0, 275),
  BlastProduct(72, "Dairy Products", "Ice Cream Vanilla", -5.6, 3.22, 2.74, 204, 0, 275),
  BlastProduct(73, "Dairy Products", "Milk Canned, condensed, sweetened", -15, 2.35, 2.3, 91, 0, 275),
  BlastProduct(74, "Dairy Products", "Milk Evaporated", -1.4, 3.56, 2.08, 247, 0, 275),
  BlastProduct(75, "Dairy Products", "Milk Whole", -0.6, 3.89, 1.81, 293, 0, 275),
  BlastProduct(76, "Miscellaneous", "Orange juice", -0.4, 3.9, 1.76, 297, 0, 275),
  BlastProduct(77, "Miscellaneous", "Sausage, Frankfurter", -1.7, 3.15, 2.31, 180, 0, 275),
  BlastProduct(78, "Miscellaneous", "Bread", -8, 2.93, 1.42, 126, 0, 275),
  BlastProduct(79, "Miscellaneous", "Chocolate", 0, 1.7, 0.85, 3, 0, 275),
  BlastProduct(80, "Miscellaneous", "Candy", -1.5, 1.9, 1.9, 40, 0, 275),
  BlastProduct(81, "Miscellaneous", "Pulses", -1.5, 1.256, 1, 39.54, 0, 135),
  BlastProduct(82, "Miscellaneous", "Jaggery", -1.5, 1.256, 1, 39.54, 0, 135),
  BlastProduct(83, "Miscellaneous", "Paratha Flour (Atta)", -1.5, 1.83, 1.83, 194.3, 0, 275),
  BlastProduct(84, "Miscellaneous", "Chappathi Flour,", -1.5, 1.83, 1.83, 217.75, 0, 275),
  BlastProduct(85, "Miscellaneous", "Raisins Seedless", -1.5, 2.07, 2.04, 52, 0, 250),
  BlastProduct(86, "Miscellaneous", "Ice/Water,", 0, 4.187, 2.108, 334, 0, 300),
];

List<BlastProduct> getBlastProducts(String productName) {
  return blastProductlist.where((element) => element.product_name == productName).toList();
}

List<String> getBlastProductFamily() {
  return blastProductlist.map((e) => e.product_family).toSet().toList();
}

List<String> getBlastProductsInFamily(String family) {
  return blastProductlist.where((element) => element.product_family == family).toList().map((e) => e.product_name).toList();
}
