import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microcoils/home/calculator/selector/selector_screen.dart';
import 'package:microcoils/home/screen/widgets/calculator_card.dart';
import 'package:microcoils/home/screen/widgets/drawer.dart';
import 'package:microcoils/home/screen/widgets/home_card.dart';
import 'package:microcoils/utils/constants/image_constaants.dart';

import '../calculator/blast room calculator/blast_room_calculator.dart';
import '../calculator/blast room calculator/data/calculator.dart';
import '../calculator/cold room calculator/cold_room_calculator_screen.dart';
import '../calculator/cold room calculator/data/calculator.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        // leading: Container(),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search)), IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_rounded))],
      ),
      drawer: AppDrawer(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          heading(),
          SizedBox(
            height: 16,
          ),
          // calculatorSelectorSection(),
          calculatoeListSection()
        ],
      ),
    );
  }

  Padding heading() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: RichText(
        text: const TextSpan(
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
          children: <TextSpan>[
            TextSpan(text: 'All Kinds of'),
            TextSpan(text: ' Heating and Cooling ', style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: 'Applications'),
          ],
        ),
      ),
    );
  }

  Widget calculatoeListSection() {
    return Container(
      child: Column(
        children: [
          HomeCard(
            onTap: () {
              ColdRoomCalculator().setDefaultValues();
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const ColdRoomCalculatorScreen()));
            },
            description: "Integral horsepower condensing units and indoor cooling units.",
            heading: "Condensing Units",
            image: ImageConstants.condensingUnit,
          ),
          HomeCard(
            onTap: () {
              BlastRoomCalculator().setDefaultValues();
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const BlastRoomCalculatorScreen()));
            },
            description: "Heat Exchangers are uniquely affordable, of extremely high quality, and delivered on time",
            heading: "Heat Exchanges",
            image: ImageConstants.coils,
          ),
          HomeCard(
            onTap: () {
              BlastRoomCalculator().setDefaultValues();
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const SelectorScreen()));
            },
            description: "They are available with fin spacing options of 4, 4.5, 6.7, 9, and 10mm.",
            heading: "Evaporators Units",
            image: ImageConstants.evaporatorUnits,
          )
        ],
      ),
    );
  }

  Widget calculatorSelectorSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8,
        ),
        children: [
          CalculatorCard(
            name: "Cold \nRoom",
            color: Colors.blue.shade900,
            image: "cold-room.png",
            onTap: () {
              ColdRoomCalculator().setDefaultValues();
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const ColdRoomCalculatorScreen()));
            },
          ),
          CalculatorCard(
            name: "Blast \nRoom",
            color: Colors.blue.shade800,
            image: "blast-room.png",
            onTap: () {
              BlastRoomCalculator().setDefaultValues();
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const BlastRoomCalculatorScreen()));
            },
          ),
          CalculatorCard(
            name: "Selector",
            color: Colors.blue.shade600,
            image: "selector.png",
            onTap: () {
              BlastRoomCalculator().setDefaultValues();
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const SelectorScreen()));
            },
          ),
        ],
      ),
    );
  }
}
