import 'package:flutter/material.dart';

import '../../../main.dart';
import '../widgets/form_section.dart';
import '../widgets/input_tile_number.dart';
import '../widgets/input_tile_option.dart';
import 'data/products.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetail> {
  List<String> family = [];
  List<String> productsInFamily = [];
  @override
  void initState() {
    family = getProductFamily();
    productsInFamily = getProductsInFamily(family[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          FormSection(
            title: "Produt Detail",
            formItems: [
              InputTileOption(
                title: "Family",
                options: family,
                inititalValue: sharedPrefColdRoom.productFamily,
                onChanged: (value) {
                  setState(() {
                    productsInFamily = getProductsInFamily(value);
                  });
                  sharedPrefColdRoom.setProductFamily(value);
                },
              ),
              InputTileOption(
                title: "Product",
                options: productsInFamily,
                inititalValue: sharedPrefColdRoom.productProduct,
                onChanged: (value) {
                  sharedPrefColdRoom.setProductProduct(value);
                },
              ),
              InputTileNumber(
                title: "Storage Density",
                initialValue: sharedPrefColdRoom.storageDensity,
                maxValue: 1000,
                minValue: 1,
                gapValue: 5,
                unit: "kg/m3",
                onChanged: (value) {
                  sharedPrefColdRoom.setStorageDensity(double.parse(value));
                },
              ),
              InputTileNumber(
                title: "Quantity",
                initialValue: sharedPrefColdRoom.quantity,
                maxValue: 100000,
                minValue: 1,
                gapValue: 5,
                unit: "kg",
                onChanged: (value) {
                  sharedPrefColdRoom.setQuantity(double.parse(value));
                },
              ),
              InputTileNumber(
                title: "Daily Loading Percentage",
                initialValue: sharedPrefColdRoom.dailyLoadPerc,
                maxValue: 100,
                minValue: 1,
                gapValue: 5,
                unit: "%",
                onChanged: (value) {
                  sharedPrefColdRoom.setDailyLoadPerc(double.parse(value));
                },
              ),
              InputTileNumber(
                title: "Product Incoming Temp",
                initialValue: sharedPrefColdRoom.productIncTemp,
                maxValue: 50,
                minValue: 1,
                gapValue: 5,
                unit: "°C",
                onChanged: (value) {
                  sharedPrefColdRoom.setProductIncTemp(double.parse(value));
                },
              ),
              InputTileNumber(
                title: "Product Final Temp",
                initialValue: sharedPrefColdRoom.productFinalTemp,
                maxValue: 25,
                minValue: 1,
                gapValue: 5,
                unit: "°C",
                onChanged: (value) {
                  sharedPrefColdRoom.setProductFinalTemp(double.parse(value));
                },
              ),
              InputTileNumber(
                title: "Cooling time",
                initialValue: sharedPrefColdRoom.coolingTime,
                maxValue: 30,
                minValue: 1,
                gapValue: 5,
                unit: "hrs",
                onChanged: (value) {
                  sharedPrefColdRoom.setCoolingTime(double.parse(value));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
