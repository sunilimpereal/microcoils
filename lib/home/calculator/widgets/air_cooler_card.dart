import 'package:flutter/material.dart';
import 'package:microcoils/home/calculator/selector/data/sharedpref_selector.dart';
import 'package:microcoils/home/calculator/selector/selector_pdf.dart';

import '../blast room calculator/blast_rrom_pdf.dart';
import '../selector/data/air_cooler_response.dart';

class AirCoolerCard extends StatefulWidget {
  final FilteredEvapoaratorDtoList filteredEvapoaratorDtoList;
  const AirCoolerCard({super.key, required this.filteredEvapoaratorDtoList});

  @override
  State<AirCoolerCard> createState() => _AirCoolerCardState();
}

class _AirCoolerCardState extends State<AirCoolerCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Air Cooler ${widget.filteredEvapoaratorDtoList.series} ${widget.filteredEvapoaratorDtoList.model}",
                    style: Theme.of(context).textTheme.headline6, // Use headline style for title
                  ),
                  IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed: () {},
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Capacity", style: Theme.of(context).textTheme.caption),
                      Text(
                          "${widget.filteredEvapoaratorDtoList.actulCapacity.toStringAsFixed(2)} KW",
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Air Flow ", style: Theme.of(context).textTheme.caption),
                      Text("${widget.filteredEvapoaratorDtoList.airFlow} m3/h",
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Refrigirant", style: Theme.of(context).textTheme.caption),
                      Text("${widget.filteredEvapoaratorDtoList.k2Refrigerant}",
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Air Throw", style: Theme.of(context).textTheme.caption),
                      Text("${widget.filteredEvapoaratorDtoList.airThrow} m",
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fin Spacing", style: Theme.of(context).textTheme.caption),
                      Text("${widget.filteredEvapoaratorDtoList.finSpacing} mm",
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Surface", style: Theme.of(context).textTheme.caption),
                      Text("${widget.filteredEvapoaratorDtoList.surfaceArea} m2",
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                ],
              ), // Increase vertical spacing

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  SelectorPdf(filteredEvapoaratorDtoList: widget.filteredEvapoaratorDtoList)
                      .generatePdf();
                },
                child: Text("Select Cooler"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
