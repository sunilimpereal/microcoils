import 'dart:developer';
import 'dart:io';

import 'package:flutter_share/flutter_share.dart';
import 'package:microcoils/main.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../utils/shared_preferences.dart';
import '../data/sharedpref_coldroom.dart';

class ColdRoomPdf {
  final doc = pw.Document();
  SharedPrefColdRoom coldRoom = sharedPrefColdRoom;
  createPage() {
    //to create pages
    doc.addPage(
      pw.MultiPage(
        pageTheme: const pw.PageTheme(),
        header: _buildHeader,
        build: (context) => [
          _contentHeader(context),
          projectDetail(context),
          ambinetDefinition(context),
          roomDefinition(context),
          productDefinotion(context),
          internalFactors(context),
          heatLoadResults(context),
          hourlyLoadText(context: context, load: "${sharedPrefColdRoom.hourlyEqipmentLoad} kW"),
          importantNotes(context),
        ],
      ),
    );
  }

  pw.Widget _buildHeader(pw.Context context) {
    return pw.Column(
      children: [
        pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: []),
        if (context.pageNumber > 1) pw.SizedBox(height: 20)
      ],
    );
  }

  generatePdf() async {
    createPage();
    final directory = await getApplicationSupportDirectory();
    final path = directory.path;
    final file = File("$path/${sharedPrefs.customer}.pdf");
    File f = await file.writeAsBytes(await doc.save());
    OpenFile.open(f.path);
    log(f.path);
  }

  sharePdf() async {
    createPage();
    final directory = await getApplicationSupportDirectory();
    final path = directory.path;
    final file = File("$path/${sharedPrefs.customer}.pdf");
    File f = await file.writeAsBytes(await doc.save());
    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: f.path,
    );
    // OpenFile.open(f.path);
    log(f.path);
  }

  _contentHeader(pw.Context context) {
    return pw.Column(children: [
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
        pw.Container(
          child: pw.Column(
            children: [
              pw.Text(sharedPref.company),
              pw.Text(sharedPref.email),
              pw.Text(sharedPref.number),
            ],
          ),
        )
      ])
    ]);
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
      tableEelment(title: "Ambient Temperature", value: "${coldRoom.ambTemp} °C"),
    ], tableElementsCol2: [
      tableEelment(title: "Ambient RH", value: "${coldRoom.ambRH} %"),
    ]);
  }

  roomDefinition(pw.Context context) {
    return tableBox(context: context, heading: "Room Definition", tableElementsCol1: [
      tableEelment(title: "Room Length", value: "${coldRoom.externalLength} m"),
      tableEelment(title: "Room Width", value: "${coldRoom.externalWidth} m"),
      tableEelment(title: "Room Height", value: "${coldRoom.externalHeight} m"),
      tableEelment(title: "insulation Thickness", value: "${coldRoom.insulationThickness} mm"),
      tableEelment(title: "Wall insulation Material", value: coldRoom.insulation),
    ], tableElementsCol2: [
      tableEelment(title: "Room internal Volume", value: "${coldRoom.roomInternalVolume} m \u00B3"),
      tableEelment(title: "Cold Room Location ", value: coldRoom.roomLocation),
      tableEelment(title: "Room temperature ", value: "${coldRoom.roomTemperature} °C"),
      tableEelment(title: "Room RH", value: "${coldRoom.roomRH} %"),
      tableEelment(title: "Door Opening Frequency", value: coldRoom.doorOpenFreq),
    ]);
  }

  productDefinotion(pw.Context context) {
    return tableBox(context: context, heading: "Product Definition", tableElementsCol1: [
      tableEelment(title: "Product", value: "${coldRoom.productProduct} "),
      tableEelment(title: "Product Quantity", value: "${coldRoom.quantity} kg"),
      tableEelment(
          title: "Product Storage \nDensity", value: "${coldRoom.storageDensity} kg/	m \u00B3"),
      tableEelment(title: "Daily Product \nLoading", value: "${coldRoom.dailyLoadPerc} kg"),
      tableEelment(title: "Product Incoming \nTemperature", value: "${coldRoom.productIncTemp} °C"),
      tableEelment(title: "Product Final \nTemperature", value: "${coldRoom.productFinalTemp} °C"),
    ], tableElementsCol2: [
      tableEelment(title: "Product family", value: "${coldRoom.productFamily} "),
      tableEelment(
          title: "Specific Heat above \nFreezing",
          value: "${coldRoom.specificHeatAboveFrez} kJ/kg°C"),
      tableEelment(
          title: "Specific Heat below \nFreezing",
          value: "${coldRoom.specificHeatBelowFrez} kJ/kg°C"),
      tableEelment(title: "Freezing temp", value: "${coldRoom.freezingTemp} °C"),
      tableEelment(title: "Respiraton Heat", value: "${coldRoom.respirationHeat} W/kg*24 h"),
    ]);
  }

  internalFactors(pw.Context context) {
    return tableBox(context: context, heading: "Internal Factors", tableElementsCol1: [
      tableEelment(title: "No of Workers", value: "${coldRoom.noPersons} "),
      tableEelment(title: "Total rated power \nof all motors", value: "${coldRoom.totRatPow} kW"),
      tableEelment(title: "Lighting", value: "${coldRoom.lighting} W/m°C"),
    ], tableElementsCol2: [
      tableEelment(title: "Working Time", value: "${coldRoom.workingHrs} h"),
      tableEelment(title: "running Time", value: "${coldRoom.motRunHrs} h"),
      tableEelment(title: "Operating Time", value: "${coldRoom.operatingHrs} h"),
    ]);
  }

  heatLoadResults(pw.Context context) {
    return tableBox(context: context, heading: "Heat Load Results", tableElementsCol1: [
      tableEelment(title: "Transmission Load", value: "${coldRoom.transmissionLoad} kW"),
      tableEelment(title: "Product Laod", value: "${coldRoom.productLoad} kW"),
      tableEelment(title: "Infiltration Load", value: "${coldRoom.infiltrationLoad} kW"),
      tableEelment(title: "Internal Load", value: "${coldRoom.internalLoad} kW"),
    ], tableElementsCol2: [
      tableEelment(title: "Safety Factor", value: "${coldRoom.safetyFactor} %"),
      tableEelment(title: "Cooling Time", value: "${coldRoom.coolingTime} h"),
      tableEelment(
          title: "Comperessor Operating \ntime", value: "${coldRoom.compressorOperatingTime} h"),
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
                pw.Row(children: [
                  pw.Column(
                    children: tableElementsCol1,
                  ),
                  pw.Column(
                    children: tableElementsCol2,
                  )
                ])
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
          pw.Text("$title  : "),
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

  pw.Widget importantNotes(pw.Context context) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            "Important Notes:",
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 8),
          pw.Text(
              "1. The actual product may vary slightly from the image and dimensions shown above"),
          pw.Text("2. It is advised that the unit should not be used in corrosive atmospheres"),
          pw.Text(
              "3. The fan data could change slightly depending on manufacturer design and data changes."),
          pw.Text(
              "4. The technical and commercial information provided is property of MICRO COILS & REFRIGERATION PVT LTD."),
          pw.Text("6. MICRO COILS heat exchangers are manufactured to world class label."),
          pw.Text("7. For further details please contact us at sales@microcoils.in"),
        ],
      ),
    );
  }
}
