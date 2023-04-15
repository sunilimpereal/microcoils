class Products {
  final int id;
  String product_name;
  String product_family;
  String respiration_heat;
  String sp_heat_above_freezing;
  String sp_heat_below_freezing;
  double freezing_temp;
  String latent_heat_freez;
  String str_loading_density;
  bool is_freez_point_available;
  Products(
    this.id,
    this.product_family,
    this.product_name,
    this.freezing_temp,
    this.sp_heat_above_freezing,
    this.sp_heat_below_freezing,
    this.latent_heat_freez,
    this.respiration_heat,
    this.str_loading_density,
    this.is_freez_point_available,
  );
}

List<Products> productList = [
  Products(1, "Vegetables", "Beans, snap", -0.70, "3.99", "1.85", "302", "2.48", "275", true),

  Products(2, "Vegetables", "Beetroot", -1.10, "3.91", "1.94", "293", "0.51", "275", true),

  Products(3, "Vegetables", "Broccoli", -0.60, "4.01", "1.82", "303", "6", "275", true),

  Products(4, "Vegetables", "Cabbage", -0.90, "4.02", "1.85", "308", "1.44", "275", true),

  Products(5, "Vegetables", "Carrots", -1.40, "3.92", "2", "293", "1.39", "275", true),

  Products(6, "Vegetables", "Cauliflower", -0.80, "4.02", "1.84", "307", "1.95", "275", true),

  Products(7, "Vegetables", "Corn, sweet, yellow", -0.60, "3.62", "1.98", "254", "5.52", "275", true),

  Products(8, "Vegetables", "Cucumbers", -0.50, "4.09", "1.71", "321", "2.04", "275", true),

  Products(9, "Vegetables", "Garlic", -0.80, "3.17", "2.19", "196", "0.68", "275", true),

  Products(10, "Vegetables", "Ginger,root", -0.80, "3.75", "1.94", "273", "2.57", "275", false),

  Products(11, "Vegetables", "Lettuce, iceberg", -0.20, "4.09", "1.65", "320", "1.56", "275", true),

  Products(12, "Vegetables", "Mushrooms", -0.90, "3.99", "1.84", "307", "5.05", "200", true),

  Products(13, "Vegetables", "Onions", -0.90, "3.95", "1.87", "300", "4.8", "275", true),

  Products(14, "Vegetables", "Peas, green", -0.60, "3.75", "1.98", "263", "5.42", "275", true),

  Products(15, "Vegetables", "Potatoes, main crop", -0.60, "3.67", "1.93", "264", "0.48", "275", true),

  Products(16, "Vegetables", "Pumpkins", -0.80, "3.97", "1.81", "306", "0", "275", true),

  Products(17, "Vegetables", "Radishes", -0.70, "4.08", "1.77", "317", "1.34", "275", true),

  Products(18, "Vegetables", "Spinach", -0.30, "4.02", "1.75", "306", "2.4", "200", true),

  Products(19, "Vegetables", "Tomatoes, mature green", -0.60, "4.02", "1.77", "311", "1.44", "275", true),

  Products(20, "Vegetables", "Vegetables-Mean Value", -0.9, "3.7", "1.85", "274", "1.35", "275", true),

  Products(21, "Fruits", "Apples, fresh", -1.1, "3.81", "1.98", "280", "0.72", "275", true),

  Products(22, "Fruits", "Bananas", -0.8, "3.56", "2.03", "248", "3.96", "275", true),

  Products(23, "Fruits", "Cherries, sweet", -1.8, "3.73", "2.12", "270", "1", "275", true),

  Products(24, "Fruits", "Dates, cured", -15.7, "2.31", "2.3", "75", "0", "275", true),

  Products(25, "Fruits", "Figs, dried", -2.4, "2.51", "4.13", "95", "0.94", "275", false),

  Products(26, "Fruits", "Grapefruit", -1.1, "3.96", "1.89", "304", "0.38", "275", true),

  Products(27, "Fruits", "Mangos", -0.9, "3.74", "1.95", "273", "3.19", "275", true),

  Products(28, "Fruits", "Watermelon", -0.4, "3.97", "1.74", "306", "0.53", "275", true),

  Products(29, "Fruits", "Oranges", -0.8, "3.81", "1.96", "275", "", "275", true),

  Products(30, "Fruits", "Pears", -1.6, "3.8", "2.06", "280", "0.96", "275", true),

  Products(31, "Fruits", "Pineapples", -1, "3.85", "1.91", "289", "3.96", "275", true),

  Products(32, "Fruits", "Raisins, seedless", -2.4, "2.07", "2.04", "52", "0", "275", false),

  Products(33, "Fruits", "Strawberries", -0.8, "4", "1.84", "306", "1.11", "275", true),

  Products(34, "Fruits", "Fruits-Mean Value", -1.2, "3.47", "1.79", "258", "1.07", "275", true),

  Products(35, "Fish", "Cod", -2.2, "3.78", "2.14", "271", "0", "275", true),

  Products(36, "Fish", "Mackerel, Atlantic", -2.2, "3.33", "2.23", "212", "0", "275", true),

  Products(37, "Fish", "Salmon, pink", -2.2, "3.68", "2.17", "255", "0", "275", true),

  Products(38, "Fish", "Tuna, bluefin", -2.2, "3.43", "2.19", "227", "0", "275", true),

  Products(39, "Fish", "Shellfish Lobster, American", -2.2, "3.64", "2.15", "256", "0", "275", true),

  Products(40, "Fish", "Shellfish Oysters", -2.2, "3.83", "2.12", "284", "0", "275", true),

  Products(41, "Fish", "Shellfish Scallop, meat", -2.2, "3.71", "2.15", "262", "0", "275", true),

  Products(42, "Fish", "Shellfish Shrimp", -2.2, "3.65", "2.16", "253", "0", "275", true),

  Products(43, "Beef", "Brisket", -2.2, "3.19", "2.33", "184", "0", "275", false),

  Products(44, "Beef", "Carcass, choice", -2.2, "3.24", "2.31", "191", "0", "275", true),

  Products(45, "Beef", "Select", -1.7, "3.25", "2.24", "194", "0", "275", true),

  Products(46, "Beef", "Ribs, whole (ribs 6-12)", -1.7, "3.16", "2.32", "182", "0", "275", false),

  Products(47, "Beef", "Full cut, lean", -1.7, "3.52", "2.12", "237", "0", "275", false),

  Products(48, "Beef", "Sirloin, lean", -1.7, "3.53", "2.11", "239", "0", "275", true),

  Products(49, "Beef", "Tenderloin, lean", -1.7, "3.45", "2.14", "228", "0", "275", false),

  Products(50, "Beef", "Veal, lean", -1.7, "3.65", "2.09", "254", "0", "275", false),

  Products(51, "Pork", "Backfat", -2.2, "2.17", "2.98", "26", "0", "275", false),

  Products(52, "Pork", "Bacon", -2.2, "2.7", "2.7", "105", "0", "275", false),

  Products(53, "Pork", "Belly", -2.2, "2.8", "3.37", "123", "0", "275", false),

  Products(54, "Pork", "Carcass", -2.2, "3.08", "3.1", "166", "0", "275", false),

  Products(55, "Pork", "Ham,cured,whole,lean", -2.2, "3.47", "2.22", "228", "0", "275", false),

  Products(56, "Pork", "Country cured,lean", -2.2, "3.16", "2.31", "187", "0", "275", false),

  Products(57, "Pork", "Shoulder, whole, lean", -2.2, "3.59", "2.2", "243", "0", "275", true),

  Products(58, "Sausage", "Frankfurter", -1.7, "3.15", "2.31", "180", "0", "275", true),

  Products(59, "Sausage", "Italian", -1.7, "3.1", "2.37", "171", "0", "275", false),

  Products(60, "Sausage", "Polish", -1.7, "3.14", "2.36", "178", "0", "275", false),

  Products(61, "Sausage", "Pork", -1.7, "2.95", "2.43", "149", "0", "275", false),

  Products(62, "Poultry Products", "Chicken", -2.8, "4.34", "3.32", "220", "0", "275", true),

  Products(63, "Poultry Products", "Duck", -2.8, "3.06", "2.45", "162", "0", "275", true),

  Products(64, "Poultry Products", "Turkey", -2.8, "3.53", "2.28", "235", "0", "275", true),

  Products(65, "Poultry Products", "Egg White", -0.6, "3.91", "1.81", "293", "0", "275", true),

  Products(66, "Poultry Products", "Egg Whole", -0.6, "3.63", "1.95", "252", "0", "275", true),

  Products(67, "Poultry Products", "Egg Yolk", -0.6, "3.05", "2.25", "163", "0", "275", true),

  Products(68, "Lamb", "Composite of cuts, lean", -1.9, "3.6", "2.14", "245", "0", "275", true),

  Products(69, "Lamb", "Leg, whole, lean", -1.9, "3.62", "2.14", "248", "0", "275", false),

  Products(70, "Dairy Products", "Butter", -12, "2.4", "2.65", "60", "0", "250", false),

  Products(71, "Dairy Products", "Cheese Camembert", -1.3, "3.1", "3.34", "173", "0", "250", false),

  Products(72, "Dairy Products", "Cheese Cheddar", -12.9, "2.77", "3.07", "123", "0", "250", true),

  Products(73, "Dairy Products", "Cheese Cottage, uncreamed (Paneer)", -1.2, "3.73", "1.99", "266", "0", "250", true),

  Products(74, "Dairy Products", "Cheese Cream", -1.3, "3.16", "2.91", "180", "0", "250", false),

  Products(75, "Dairy Products", "Cheese Gouda", -12.9, "2.87", "2.77", "138", "0", "250", false),

  Products(76, "Dairy Products", "Cheese Limburger", -7.4, "3.03", "2.82", "162", "0", "250", true),

  Products(77, "Dairy Products", "Cheese Mozzarella", -2.5, "3.15", "2.46", "181", "0", "250", false),

  Products(78, "Dairy Products", "Cheese Parmesan, hard", -12.8, "2.58", "2.94", "97", "0", "250", false),

  Products(79, "Dairy Products", "Cheese Processed American", -12.9, "2.8", "2.75", "131", "0", "250", true),

  Products(80, "Dairy Products", "Cheese Roquefort", -16.3, "2.8", "3.36", "132", "0", "250", true),

  Products(81, "Dairy Products", "Cheese Swiss", -10, "2.78", "2.88", "124", "0", "250", true),

  Products(82, "Dairy Products", "Cream Half and half", -2.2, "3.73", "2.16", "269", "0", "250", false),

  Products(83, "Dairy Products", "Cream Table", -2.2, "3.59", "2.21", "246", "0", "250", true),

  Products(84, "Dairy Products", "Cream Heavy whipping", -2.2, "3.25", "2.32", "193", "0", "250", false),

  Products(85, "Dairy Products", "Ice Cream,Chocolate ", -5.6, "3.11", "2.75", "186", "0", "250", true),

  Products(86, "Dairy Products", "Ice Cream Strawberry", -5.6, "3.19", "2.74", "200", "0", "250", true),

  Products(87, "Dairy Products", "Ice Cream Vanilla", -5.6, "3.22", "2.74", "204", "0", "250", true),

  Products(88, "Dairy Products", "Milk Canned, condensed, sweetened", -15, "2.35", "1.85", "91", "0", "300", true),

  Products(89, "Dairy Products", "Milk Evaporated", -1.4, "3.56", "2.08", "247", "0", "300", true),

  Products(90, "Dairy Products", "Milk Skim", -0.6, "3.95", "1.78", "303", "0", "300", false),

  Products(91, "Dairy Products", "Milk Whole", -0.6, "3.89", "1.81", "293", "0", "300", true),

  Products(92, "Dairy Products", "Milk Dried", -0.6, "1.85", "1.85", "8", "0", "300", false),

  Products(93, "Dairy Products", "Milk Whey, acid, dried", -0.6, "1.68", "1.68", "12", "0", "300", false),

  Products(94, "Nuts, Shelled", "Almonds", -1.5, "2.2", "2.2", "15", "0", "250", true),

  Products(95, "Nuts, Shelled", "Peanuts, raw", -1.5, "2.23", "2.23", "22", "0", "250", false),

  Products(96, "Nuts, Shelled", "Walnuts, English", -1.5, "2.09", "2.09", "12", "0", "250", false),

  Products(97, "Candy", "Fudge, vanilla", -1.5, "1.9", "1.9", "36", "0", "250", false),

  Products(98, "Candy", "Marshmallows", -1.5, "2.02", "2.02", "55", "0", "250", false),

  Products(99, "Candy", "Milk chocolate", -1.5, "1.83", "1.83", "4", "0", "250", false),

  Products(100, "Candy", "Peanut, brittle", -1.5, "1.77", "1.77", "6", "0", "250", false),

  Products(101, "Juice and Beverages", "Apple juice, unsweetened", -0.4, "3.87", "1.78", "294", "0", "300", false),

  Products(102, "Juice and Beverages", "Grapefruit juice, sweetened", -0.4, "3.85", "3.85", "292", "0", "300", false),

  Products(103, "Juice and Beverages", "Lemon juice", -0.4, "3.99", "1.73", "309", "0", "300", false),

  Products(104, "Juice and Beverages", "Orange juice", -0.4, "3.9", "1.76", "297", "0", "300", true),

  Products(105, "Juice and Beverages", "Pineapple juice, unsweetened", -0.4, "3.81", "1.81", "286", "0", "300", false),

  Products(106, "Juice and Beverages", "Tomato juice", -0.4, "4.03", "1.71", "314", "0", "300", false),

  Products(107, "Juice and Beverages", "Fruit punch drink", -0.4, "3.87", "1.78", "294", "0", "300", false),

  Products(108, "Juice and Beverages", "Club soda", -0.2, "4.17", "1.63", "334", "0", "300", false),

  Products(109, "Juice and Beverages", "Cola", -0.2, "3.9", "1.76", "299", "0", "300", false),

  Products(110, "Juice and Beverages", "Ginger ale", -0.2, "3.95", "1.73", "305", "0", "300", false),

  Products(111, "Juice and Beverages", "Lemon-lime soda", -0.2, "3.9", "1.76", "299", "0", "300", false),

  Products(112, "Juice and Beverages", "Root beer", -0.2, "3.9", "1.76", "298", "0", "300", false),

  Products(113, "Juice and Beverages", "Chocolate milk, 2% fat", -0.2, "3.78", "1.83", "279", "0", "300", false),

  Products(114, "Miscellaneous", "Honey", -0.2, "2.03", "2.03", "57", "0", "300", false),

  Products(115, "Miscellaneous", "Maple syrup", -0.2, "2.41", "2.41", "107", "0", "300", false),

  Products(116, "Miscellaneous", "Popcorn, air-popped", -0.2, "2.04", "2.04", "14", "0", "135", false),

  Products(117, "Miscellaneous", "Yeast, baker’s, compressed", -1, "3.55", "2.17", "230", "0", "250", false),

  Products(118, "Miscellaneous", "Bread", -8, "2.93", "1.42", "126", "0", "275", true),

//            Products(119, "Miscellaneous", "Chocolate", "0",
//                    "1.7", "0.85", "3", "0", "275",true
//         ),
//
//

  Products(120, "Miscellaneous", "Sugar", -15, "0.84", "0.84", "2.1", "0", "275", false),

  Products(121, "Miscellaneous", "Rice", -1.7, "1.09", "0.92", "33.5", "0", "275", false),

  Products(122, "Miscellaneous", "Flowers", -1.5, "3.77", "1.93", "293.3", "2.4", "275", true),

//            Products(123, "Miscellaneous", "Candy", "-1.5",
//                    "1.9", "1.9", "40", "0", "275",false
//         ),
//
//

  Products(124, "Miscellaneous", "Red Chilly Dried", -1.5, "1.256", "1", "39.54", "0", "135", false),

  Products(125, "Miscellaneous", "Indian Spices", -1.5, "1.256", "1", "39.54", "0", "135", false),

  Products(126, "Miscellaneous", "Pulses", -1.5, "1.256", "1", "39.54", "0", "135", false),

  Products(127, "Miscellaneous", "Tamarind", -1.5, "1.256", "1", "39.54", "0", "135", false),

  Products(128, "Miscellaneous", "Jaggery", -1.5, "1.256", "1", "39.54", "0", "135", false),

  Products(129, "Miscellaneous", "Paratha Flour (Atta)", -1.5, "1.83", "1.83", "194.3", "0", "275", true),

  Products(130, "Miscellaneous", "Chappathi Flour", -1.5, "1.83", "1.83", "217.75", "0", "275", true),

  Products(131, "Miscellaneous", "Garlic Dry", -0.83, "2.88", "1.67", "207", "0", "275", false),

//            Products(132, "Miscellaneous", "Raisins Seedless", "-1.5", "2.07",
//                    "2.04", "52", "0", "250",true),
//
//

  Products(133, "Miscellaneous", "Ice/Water", 0, "4.187", "2.108", "334", "0", "300", false),
];

List<Products> getProducts(String productName) {
  return productList.where((element) => element.product_name == productName).toList();
}

List<String> getProductFamily() {
  return productList.map((e) => e.product_family).toSet().toList();
}

List<String> getProductsInFamily(String family) {
  return productList.where((element) => element.product_family == family).toList().map((e) => e.product_name).toList();
}
