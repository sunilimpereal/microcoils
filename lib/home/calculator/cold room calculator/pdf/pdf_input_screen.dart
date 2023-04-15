import 'package:flutter/material.dart';
import 'package:microcoils/authentication/screens/widgets/input_field.dart';
import 'package:microcoils/home/profile/widgets/app_bar.dart';
import 'package:microcoils/main.dart';

import '../../../../utils/screen.dart';
import 'cold_room_pdf.dart';

class PdfInputScreen extends StatefulWidget {
  final Function ongeneratePdf;
  final Function onSharePdf;
  const PdfInputScreen({super.key, required this.ongeneratePdf, required this.onSharePdf});

  @override
  State<PdfInputScreen> createState() => _PdfInputScreenState();
}

class _PdfInputScreenState extends State<PdfInputScreen> {
  TextEditingController customerController = TextEditingController();
  TextEditingController jobReferenceController = TextEditingController();
  TextEditingController roomNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(title: "Details"),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    AppInputField(
                      label: "Customer",
                      textEditingController: customerController,
                      onSubmitted: (value) {
                        setState(() {
                          _formKey.currentState!.validate();
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Customer Name";
                        }
                        return null;
                      },
                    ),
                    AppInputField(
                      label: "Job Reference",
                      textEditingController: jobReferenceController,
                      onSubmitted: (value) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Job Reference";
                        }
                        return null;
                      },
                    ),
                    AppInputField(
                      label: "Room name",
                      textEditingController: roomNameController,
                      onSubmitted: (value) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Room Name";
                        }
                        return null;
                      },
                    ),
                    AppInputField(
                      label: "Email Id",
                      textEditingController: emailIdController,
                      onSubmitted: (value) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Email Id";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                sharedPref.setPdfInputs(
                                  customer: customerController.text,
                                  jobReference: jobReferenceController.text,
                                  roomName: roomNameController.text,
                                  emailId: emailIdController.text,
                                );
                                Future.delayed(const Duration(milliseconds: 100));
                                widget.onSharePdf();
                                // ColdRoomPdf().generatePdf();
                              }
                            },
                            child: const Text("Share PDF"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                sharedPref.setPdfInputs(
                                  customer: customerController.text,
                                  jobReference: jobReferenceController.text,
                                  roomName: roomNameController.text,
                                  emailId: emailIdController.text,
                                );
                                Future.delayed(const Duration(milliseconds: 100));
                                widget.ongeneratePdf();
                                // ColdRoomPdf().generatePdf();
                              }
                            },
                            child: const Text("Generate PDF"),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
