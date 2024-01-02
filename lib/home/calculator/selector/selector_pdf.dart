import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';
import 'package:microcoils/home/calculator/selector/data/sharedpref_selector.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

import '../../../main.dart';
import 'data/air_cooler_response.dart';

class SelectorPdf {
  final FilteredEvapoaratorDtoList filteredEvapoaratorDtoList;
  SelectorPdf({required this.filteredEvapoaratorDtoList});
  final doc = pw.Document();
  late final image;
  SharedPrefSelector selector = SharedPrefSelector();
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
          _modelDetails(context),
          _fansDetails(context),
          _casingDetails(context),
          _refrigirantDetails(context),
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
    String name = "Selector-" + "${DateTime.now().toUtc().toString()}";
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
      filePath: f.path as String,
    );
    // OpenFile.open(f.path);
    log(f.path);
  }

  _contentHeader(pw.Context context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

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
      padding: pw.EdgeInsets.all(8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Container(
                margin: pw.EdgeInsets.all(8),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Model    "),
                    pw.Text(
                        "${filteredEvapoaratorDtoList.series} ${filteredEvapoaratorDtoList.model} ${filteredEvapoaratorDtoList.surfaceArea} ${filteredEvapoaratorDtoList.finSpacing} ${filteredEvapoaratorDtoList.d}"),
                  ],
                ),
              ),
            ],
          ),
          _buildUnderlinedText("Capacity Details:"),
          _buildTwoColumnContent(
              title: "Capacity", data: "${filteredEvapoaratorDtoList.actulCapacity} (kW)"),
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
      padding: pw.EdgeInsets.all(8),
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
        ],
      ),
    );
  }

  _fansDetails(pw.Context context) {
    return pw.Padding(
      padding: pw.EdgeInsets.all(8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _buildUnderlinedText("Fans Details:"),
          _buildTwoColumnContent(
              title: "Number of Fans", data: "${filteredEvapoaratorDtoList.fan}"),
          _buildTwoColumnContent(title: "Fan Diameter", data: "9 (mm)"),
          _buildTwoColumnContent(
              title: "Fin Spacing", data: "${filteredEvapoaratorDtoList.finSpacing} (mm)"),
          _buildTwoColumnContent(
              title: "Fan Voltage", data: "${filteredEvapoaratorDtoList.voltage} (V)"),
          _buildTwoColumnContent(title: "Fan Current", data: "0.46/0.56 (A)"),
          _buildTwoColumnContent(title: "Defrost Type", data: sharedPrefSelector.defrosting),
        ],
      ),
    );
  }

  _casingDetails(pw.Context context) {
    return pw.Padding(
      padding: pw.EdgeInsets.all(8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _buildUnderlinedText("Casing Details:"),
          _buildTwoColumnContent(title: "Tubes", data: filteredEvapoaratorDtoList.tubeMaterial),
          _buildTwoColumnContent(title: "Fins", data: filteredEvapoaratorDtoList.finMaterial),
          _buildTwoColumnContent(title: "A", data: "${filteredEvapoaratorDtoList.a} (mm)"),
          _buildTwoColumnContent(title: "B", data: "${filteredEvapoaratorDtoList.b} (mm)"),
          _buildTwoColumnContent(title: "C", data: "${filteredEvapoaratorDtoList.c} (mm)"),
          _buildTwoColumnContent(title: "D", data: "${filteredEvapoaratorDtoList.d} (mm)"),
          _buildTwoColumnContent(title: "E", data: "${filteredEvapoaratorDtoList.e} (mm)"),
          _buildTwoColumnContent(title: "F", data: "${filteredEvapoaratorDtoList.f} (mm)"),
          _buildTwoColumnContent(title: "G", data: "${filteredEvapoaratorDtoList.g} (mm)"),
          _buildTwoColumnContent(title: "H", data: "${filteredEvapoaratorDtoList.h} (mm)"),
          _buildTwoColumnContent(title: "H1", data: "${filteredEvapoaratorDtoList.h1} (mm)"),
          _buildTwoColumnContent(title: "H2", data: "${filteredEvapoaratorDtoList.h2} (mm)"),
          _buildTwoColumnContent(title: "Inlet Connection", data: "12 (mm)"),
          _buildTwoColumnContent(title: "Outlet Connection", data: "19 (mm)"),
        ],
      ),
    );
  }

  pw.Widget _buildUnderlinedText(String text) {
    return pw.Padding(
      padding: pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        style: pw.TextStyle(decoration: pw.TextDecoration.underline),
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
        margin: pw.EdgeInsets.all(8),
        child: pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(data),
          ],
        ),
      ),
    );
  }
}
