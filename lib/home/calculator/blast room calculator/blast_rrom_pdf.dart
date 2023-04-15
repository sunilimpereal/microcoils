import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

import '../../../main.dart';
import 'data/sharedpref_bastroom.dart';

class BlastRoomPdf {
  final doc = pw.Document();
  late final image;
  SharedPrefBlastRoom blastRoom = sharedPrefBlastRoom;
  createPage() async {
    image = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
    );
    //to create pages
    doc.addPage(
      pw.MultiPage(
        pageTheme: const pw.PageTheme(),
        header: _buildHeader,
        build: (context) => [
          _contentHeader(context),
          projectDetail(context),
          ambinetDefinition(context),
          productDefinotion(context),
          heatLoadResults(context),
          hourlyLoadText(context: context, load: "${sharedPrefColdRoom.hourlyEqipmentLoad} kW"),
        ],
      ),
    );
  }

  pw.Widget _buildHeader(pw.Context context) {
    return pw.Column(
      children: [pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: []), if (context.pageNumber > 1) pw.SizedBox(height: 20)],
    );
  }

  generatePdf() async {
    await createPage();

    final directory = await getApplicationSupportDirectory();
    final path = directory.path;
    final file = File("$path/${sharedPref.customer}.pdf");
    File f = await file.writeAsBytes(await doc.save());
    OpenFile.open(f.path);
    log(f.path);
  }

  sharePdf() async {
    createPage();
    final directory = await getApplicationSupportDirectory();
    final path = directory.path;
    final file = File("$path/${sharedPref.customer}.pdf");
    File f = await file.writeAsBytes(await doc.save());
    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: f.path as String,
    );
    // OpenFile.open(f.path);
    log(f.path);
  }

  _contentHeader(pw.Context context) {
    return pw.Padding(
      padding: pw.EdgeInsets.all(8),
      child: pw.Column(
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Container(width: 100, child: pw.Image(image)),
              pw.Container(
                child: pw.Column(
                  children: [
                    pw.Text(sharedPref.company),
                    pw.Text(sharedPref.email),
                    pw.Text(sharedPref.number),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  projectDetail(pw.Context context) {
    return tableBox(
      context: context,
      heading: "Project Detail",
      tableElementsCol1: [
        tableEelment(title: "Room Name", value: "${sharedPref.roomName} "),
        tableEelment(title: "project Refereance", value: "${sharedPref.jobReferance} "),
      ],
      tableElementsCol2: [
        tableEelment(title: "Customer Name", value: "${sharedPref.customer} "),
        tableEelment(title: "Email ID", value: "${sharedPref.emailId} "),
      ],
    );
  }

  ambinetDefinition(pw.Context context) {
    return tableBox(context: context, heading: "Ambient Definition", tableElementsCol1: [
      tableEelment(title: "Ambient Temperature", value: "${blastRoom.ambTemp} °C"),
    ], tableElementsCol2: [
      tableEelment(title: "Ambient RH", value: "${blastRoom.ambRH} %"),
    ]);
  }

  roomDefinition(pw.Context context) {
    return tableBox(context: context, heading: "Room Definition", tableElementsCol1: [
      tableEelment(title: "Room Length", value: "${blastRoom.externalLength} m"),
      tableEelment(title: "Room Width", value: "${blastRoom.externalWidth} m"),
      tableEelment(title: "Room Height", value: "${blastRoom.externalHeight} m"),
      tableEelment(title: "insulation Thickness", value: "${blastRoom.insulationThickness} mm"),
      tableEelment(title: "Wall insulation Material", value: blastRoom.insulation),
    ], tableElementsCol2: [
      tableEelment(title: "Room internal Volume", value: "${blastRoom.roomInternalVolume} m \u00B3"),
      tableEelment(title: "Cold Room Location ", value: blastRoom.roomLocation),
      tableEelment(title: "Room temperature ", value: "${blastRoom.roomTemperature} °C"),
      tableEelment(title: "Room RH", value: "${blastRoom.roomRH} %"),
      tableEelment(title: "Door Opening Frequency", value: blastRoom.doorOpenFreq),
    ]);
  }

  productDefinotion(pw.Context context) {
    return tableBox(context: context, heading: "Room Definition", tableElementsCol1: [
      tableEelment(title: "Product family", value: "${blastRoom.productFamily} "),
      tableEelment(title: "Product", value: "${blastRoom.productProduct} "),
      tableEelment(title: "Product Incoming Temperature", value: "${blastRoom.productIncTemp} °C"),
      tableEelment(title: "Product Final Temperature", value: "${blastRoom.productFinalTemp} °C"),
    ], tableElementsCol2: [
      tableEelment(title: "Respiraton Heat", value: "${blastRoom.respirationHeat} W/kg*24 h"),
      tableEelment(title: "Specific Heat above Freezing", value: "${blastRoom.specificHeatAboveFreezing} kJ/kg°C"),
      tableEelment(title: "Specific Heat below Freezing", value: "${blastRoom.specificHeatBelowFreezing} kJ/kg°C"),
      tableEelment(title: "Freezing temp", value: "${blastRoom.freezingTemp} °C"),
      tableEelment(title: "Latent Heat of Freeezing", value: "${blastRoom.latentHeatOFFreezing} kJ/kg"),
    ]);
  }

  heatLoadResults(pw.Context context) {
    return tableBox(context: context, heading: "Heat Load Results", tableElementsCol1: [
      tableEelment(title: "Transmission Load", value: "${blastRoom.transmissionLoad} kW"),
      tableEelment(title: "Product Laod", value: "${blastRoom.productLoad} kW"),
      tableEelment(title: "Infiltration Load", value: "${blastRoom.infiltrationLoad} kW"),
      tableEelment(title: "Internal Load", value: "${blastRoom.internalLoad} kW"),
    ], tableElementsCol2: [
      tableEelment(title: "Total rated Power of all motors", value: "${blastRoom.totRatPow} W"),
      tableEelment(title: "Safety Factor", value: "${blastRoom.safetyFactor} %"),
      tableEelment(title: "Pull Down time", value: "${blastRoom.pullDownTime} h"),
    ]);
  }

  tableBox({
    required pw.Context context,
    required String heading,
    required List<pw.Widget> tableElementsCol1,
    required List<pw.Widget> tableElementsCol2,
  }) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Column(
        children: [
          pw.Container(
            decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 0.5),
              // color: PdfColors.green,
            ),
            child: pw.Column(
              children: [
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: PdfColors.blue,
                  child: pw.Container(
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Text(
                          heading,
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.Row(
                  children: [
                    pw.Column(
                      children: tableElementsCol1,
                    ),
                    pw.Column(
                      children: tableElementsCol2,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget tableEelment({
    required String title,
    required String value,
  }) {
    // returnstable element
    return pw.Container(
      width: 220,
      padding: const pw.EdgeInsets.all(8),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Container(
            width: 120,
            child: pw.Text("$title  : ", overflow: pw.TextOverflow.clip),
          ),
          pw.Text(value),
        ],
      ),
    );
  }

  hourlyLoadText({required pw.Context context, required String load}) {
    return pw.Container(
      width: double.maxFinite,
      padding: const pw.EdgeInsets.all(8),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: [
          pw.Text(
            "Hourly Equipment Load : $load",
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
