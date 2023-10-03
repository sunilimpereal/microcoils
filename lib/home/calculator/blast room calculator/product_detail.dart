import 'package:flutter/material.dart';

import '../../../main.dart';
import '../cold room calculator/data/products.dart';
import '../widgets/form_section.dart';
import '../widgets/input_tile_number.dart';
import '../widgets/input_tile_option.dart';
import 'data/blast_products.dart';
import 'data/sharedpref_bastroom.dart';

class BlastRoomProductDetail extends StatefulWidget {
  const BlastRoomProductDetail({super.key});

  @override
  State<BlastRoomProductDetail> createState() => _BlastRoomProductDetailState();
}

class _BlastRoomProductDetailState extends State<BlastRoomProductDetail> {
  List<String> family = [];
  List<String> productsInFamily = [];

  @override
  void initState() {
    family = getBlastProductFamily();
    productsInFamily = getBlastProductsInFamily(family[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FormSection(
              title: "Product Detail",
              formItems: [
                InputTileOption(
                  title: "Family",
                  options: family,
                  inititalValue: sharedPrefBlastRoom.productFamily,
                  onChanged: (value) {
                    sharedPrefBlastRoom.setProductFamily(value);
                  },
                ),
                InputTileOption(
                  title: "Product",
                  options: productsInFamily,
                  inititalValue: sharedPrefsBlastRoom.productProduct,
                  onChanged: (value) {
                    sharedPrefBlastRoom.setProductFamily(value);
                  },
                ),
                InputTileNumber(
                  title: "Quantity per batch",
                  initialValue: 2000,
                  maxValue: 10000,
                  minValue: 1,
                  gapValue: 5,
                  unit: "kg",
                  onChanged: (value) {
                    sharedPrefBlastRoom.setQuantityPerBatch(double.parse(value));
                  },
                ),
                InputTileNumber(
                  title: "Product incoming temp",
                  initialValue: 4,
                  maxValue: 100,
                  minValue: 1,
                  gapValue: 5,
                  unit: "°C",
                  onChanged: (value) {
                    sharedPrefBlastRoom.setProductIncTemp(double.parse(value));
                  },
                ),
                InputTileNumber(
                  title: "Product final",
                  initialValue: -18,
                  maxValue: -100,
                  minValue: 1,
                  gapValue: 5,
                  unit: "°C",
                  onChanged: (value) {
                    sharedPrefBlastRoom.setProductFinalTemp(double.parse(value));
                  },
                ),
                InputTileNumber(
                  title: "Pull down time",
                  initialValue: 8,
                  maxValue: 100,
                  minValue: 1,
                  gapValue: 5,
                  unit: "hrs",
                  onChanged: (value) {
                    sharedPrefBlastRoom.setPullDownTime(double.parse(value));
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
