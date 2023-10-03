import 'package:flutter/material.dart';
import 'package:microcoils/home/screen/widgets/drawer.dart';
import 'package:microcoils/utils/constants/image_constaants.dart';
import '../../../utils/screen.dart';
import '../widgets/app_bar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text('About US'),
      ),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "About Micro Coils",
                  // textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Text(
                "Micro Coils was established to fill the gap between demand and supply of high quality, reliable and cost-effective coils in the HVACR Industry across Asia. We saw an early success with customers across geographies not just because of our strong product, but also due to our even stronger design and post-sales support to our customers. Our engineers work closely with every single customer to meet their unique requirements in terms of product design and timeline of deliveries. Micro Coils go out of our way to help customers meet their business requirements and ensure complete customer satisfaction.",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black),
              ),
              Divider(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Our Products",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              productTile(
                  description:
                      'Micro Coils\' Heat Exchangers are uniquely affordable, of extremely high quality, and delivered on time without compromise. We provide design expertise for custom development and tailor-made solutions to meet your business requirements.',
                  image: ImageConstants.coils,
                  title: 'Heat Exchangers'),
              productTile(
                  description:
                      'Ideal for a range of applications, including evaporative condensers, milk tanks, process tanks, immersion chillers, ice machines, heat recovery banks, conveyors, beer/wine tanks, falling film chillers, and special-purpose cooling for dirty fluids..',
                  image: ImageConstants.pillowPlates,
                  title: 'Pillow Plates'),
              productTile(
                  description:
                      'Micro Coils\' integral horsepower condensing units and indoor cooling units deliver exceptional cooling. They are well-suited for various cold chain applications, such as milk cooling, fruits & vegetables, cold storage, meat/poultry, fishery, and food services.',
                  image: ImageConstants.condensingUnit,
                  title: 'Condensing Units'),
              productTile(
                  description:
                      'Our evaporator units offer a range of features, including low noise levels, high-performance fans, low energy consumption, highly efficient heat exchangers, easy installation, and maintenance. They are available with fin spacing options of 4, 4.5, 6.7, 9, and 10mm.',
                  image: ImageConstants.evaporatorUnits,
                  title: 'Evaporators Units'),
            ],
          ),
        ),
      ),
    );
  }

  Widget productTile({required String title, required String image, required String description}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
          ),
          Text(description),
          SizedBox(
            height: 8,
          ),
          Divider(),
        ],
      ),
    );
  }
}
