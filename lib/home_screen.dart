import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:untitled/resume_pdf.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume App'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Generate the PDF file
            final pdfBytes = await generateResume();
            // Display the PDF in a preview
            Printing.layoutPdf(
              onLayout: (PdfPageFormat format) async => pdfBytes,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Set button background to red
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Add padding for a "cool" look
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners for a modern look
            ),
            elevation: 5, // Add elevation for depth/shadow
            textStyle: TextStyle(
              fontSize: 16, // Increase the font size for visibility
              fontWeight: FontWeight.bold, // Bold text for emphasis
             // White text color
            ),
          ),
          child: Text('Show Resume'),
        ),
      ),
    );
  }
}
