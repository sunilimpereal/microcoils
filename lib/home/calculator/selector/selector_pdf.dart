import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';
import 'package:microcoils/home/calculator/selector/data/sharedpref_selector.dart';
import 'package:microcoils/utils/ApiUrls.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../main.dart';
import 'data/air_cooler_response.dart';

class SelectorPdf {
  final FilteredEvapoaratorDtoList filteredEvapoaratorDtoList;
  SelectorPdf({required this.filteredEvapoaratorDtoList});
  final doc = pw.Document();
  late final image;
  late final microcool_logo;
  SharedPrefSelector selector = SharedPrefSelector();
  createPage() async {
    image = pw.MemoryImage(
      (await rootBundle.load('assets/images/microcoil_logo_address.jpeg')).buffer.asUint8List(),
    );
    microcool_logo = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
    );

    final netImage =
        await networkImage("${ApiUrls.baseUrl}/img/${filteredEvapoaratorDtoList.evImg}.jpg");
    log("${ApiUrls.baseUrl}/img/${filteredEvapoaratorDtoList.evImg}.jpg");
    //to create pages
    doc.addPage(
      pw.MultiPage(
        pageTheme: const pw.PageTheme(
          margin: pw.EdgeInsets.all(36),
        ),
        header: _buildHeader,
        build: (context) => [
          _contentHeader(context),
          _modelDetails(context),
          _refrigirantDetails(context),
          _fansDetails(context),
          _casingDetails(context),
          pw.Container(width: 250, child: pw.Image(netImage)),
          importantNotes(context),
        ],
      ),
    );
    doc.addPage(
      pw.MultiPage(
        pageTheme: const pw.PageTheme(
          margin: pw.EdgeInsets.all(36),
        ),
        build: (context) => [
          pw.Container(width: 300, child: pw.Image(netImage)),
          importantNotes(context),
        ],
      ),
    );
  }

  pw.Widget _buildHeader(pw.Context context) {
    return pw.Column(
      children: [
        pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: []),
        if (context.pageNumber > 1) pw.SizedBox(height: 20),
        pw.Row(children: [pw.Column(children: []), pw.Column(children: [])])
      ],
    );
  }

  generatePdf() async {
    await createPage();

    final directory = await getApplicationSupportDirectory();
    final path = directory.path;
    String name = "Selector-${DateTime.now().toUtc()}";
    final file = File("$path/$name.pdf");
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
      filePath: f.path,
    );
    // OpenFile.open(f.path);
    log(f.path);
  }

  _contentHeader(pw.Context context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Column(
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Container(width: 150, child: pw.Image(image)),
              pw.Container(width: 150, child: pw.Image(microcool_logo)),
              pw.Container(
                child: pw.Column(
                  children: [
                    pw.Text(formattedDate),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _modelDetails(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.all(8),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Model    "),
                    pw.Text(
                        "${filteredEvapoaratorDtoList.series} ${filteredEvapoaratorDtoList.model} ${filteredEvapoaratorDtoList.surfaceArea.round()}  ${filteredEvapoaratorDtoList.finSpacing == filteredEvapoaratorDtoList.finSpacing.roundToDouble() ? filteredEvapoaratorDtoList.finSpacing.round() : filteredEvapoaratorDtoList.finSpacing}D"),
                  ],
                ),
              ),
            ],
          ),
          _buildUnderlinedText("Capacity Details:"),
          _buildTwoColumnContent(
              title: "Capacity",
              data: "${filteredEvapoaratorDtoList.actulCapacity.toStringAsFixed(2)} (kW)"),
          _buildTwoColumnContent(
              title: "Surface", data: "${filteredEvapoaratorDtoList.surfaceArea} (m2)"),
          _buildTwoColumnContent(
              title: "Air Flow", data: "${filteredEvapoaratorDtoList.airFlow} (m3/h)"),
          _buildTwoColumnContent(
              title: "Air Throw", data: "${filteredEvapoaratorDtoList.airThrow} (m)"),
        ],
      ),
    );
  }

  _refrigirantDetails(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _buildUnderlinedText("Refrigerant Details:"),
          _buildTwoColumnContent(
              title: "Refrigerant Type", data: filteredEvapoaratorDtoList.k2Refrigerant),
          _buildTwoColumnContent(
              title: "Evaporator Temp.", data: "${filteredEvapoaratorDtoList.evTemp} (C)"),
          _buildTwoColumnContent(
              title: "DT1", data: "${filteredEvapoaratorDtoList.tempCorrectionFactor} (K)"),
          _buildTwoColumnContent(
              title: "Condenser Temp.", data: "${filteredEvapoaratorDtoList.condTemp} (C)"),
        ],
      ),
    );
  }

  _fansDetails(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _buildUnderlinedText("Fans:"),
          _buildTwoColumnContent(
              title: "Fan Detail",
              data: filteredEvapoaratorDtoList.fan.replaceFirst("X", "(mm) X")),
          _buildTwoColumnContent(
              title: "Fin Spacing", data: "${filteredEvapoaratorDtoList.finSpacing} D"),
          _buildTwoColumnContent(title: "Fan Voltage", data: filteredEvapoaratorDtoList.voltage),
          _buildTwoColumnContent(
              title: "Fan Power", data: "${filteredEvapoaratorDtoList.fanpower} (W)"),
          _buildTwoColumnContent(title: "Defrost Type", data: sharedPrefSelector.defrosting),
          _buildTwoColumnContent(
              title: "Defrost Total Power", data: filteredEvapoaratorDtoList.defTtl.toString()),
        ],
      ),
    );
  }

  _casingDetails(pw.Context context) {
    double num =
        double.parse(filteredEvapoaratorDtoList.fan[filteredEvapoaratorDtoList.fan.length - 1]);
    log(num.toString());
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _buildUnderlinedText("Casing Details: AIMg3/Powder coated RAL 9003/SS-304"),
          _buildTwoColumnContent(title: "Tubes", data: filteredEvapoaratorDtoList.tubeMaterial),
          _buildTwoColumnContent(title: "Fins", data: filteredEvapoaratorDtoList.finMaterial),
          _buildTwoColumnContent(title: "A", data: "${filteredEvapoaratorDtoList.a} (mm)"),
          _buildTwoColumnContent(title: "B", data: "${filteredEvapoaratorDtoList.b} (mm)"),
          num == 1.0
              ? pw.Container()
              : _buildTwoColumnContent(title: "C", data: "${filteredEvapoaratorDtoList.c} (mm)"),
          num == 1.0 || num == 2.0
              ? pw.Container()
              : _buildTwoColumnContent(title: "D", data: "${filteredEvapoaratorDtoList.d} (mm)"),
          _buildTwoColumnContent(title: "E", data: "${filteredEvapoaratorDtoList.e} (mm)"),
          _buildTwoColumnContent(title: "F", data: "${filteredEvapoaratorDtoList.f} (mm)"),
          _buildTwoColumnContent(title: "G", data: "${filteredEvapoaratorDtoList.g} (mm)"),
          _buildTwoColumnContent(title: "H", data: "${filteredEvapoaratorDtoList.h} (mm)"),
          _buildTwoColumnContent(title: "H1", data: "${filteredEvapoaratorDtoList.h1} (mm)"),
          _buildTwoColumnContent(title: "H2", data: "${filteredEvapoaratorDtoList.h2} (mm)"),
          _buildTwoColumnContent(
              title: "Inlet Connection",
              data: "${filteredEvapoaratorDtoList.refrigerantInlet} (mm)"),
          _buildTwoColumnContent(
              title: "Outlet Connection",
              data: "${filteredEvapoaratorDtoList.refrigerantOutlet} (mm)"),
        ],
      ),
    );
  }

  pw.Widget _buildUnderlinedText(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 8),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          decoration: pw.TextDecoration.underline,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
    );
  }

  pw.Widget _buildTwoColumnContent({required String title, required String data}) {
    return pw.Container(
        width: 600,
        child: pw.Row(
          children: [
            _buildColumn(title),
            _buildColumn(data),
          ],
        ));
  }

  pw.Widget _buildColumn(String data) {
    return pw.Expanded(
      child: pw.Container(
        margin: const pw.EdgeInsets.all(0),
        child: pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(data),
          ],
        ),
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
