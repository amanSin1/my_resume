import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generateResume() async {
  final pdf = pw.Document();

  // Font definitions
  final fontData = await rootBundle.load('assets/fonts/zai_OlivettiLettera22Typewriter.ttf');
  final customFont = pw.Font.ttf(fontData.buffer.asByteData());
  final regularFont = pw.Font.helvetica();
  // Load a custom font that supports Unicode
  final unicodeFontData = await rootBundle.load('assets/fonts/NotoColorEmoji-Regular.ttf');
  final unicodeFont = pw.Font.ttf(unicodeFontData.buffer.asByteData());

  // Color definitions
  final headerColor = PdfColors.brown;
  final bodyColor = PdfColors.black;
  final lineColor = PdfColors.grey;

  // Page setup
  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.all(16),
      build: (pw.Context context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // Header
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                "Aman Singh",
                style: pw.TextStyle(
                  font: customFont,
                  fontSize: 30,
                  fontWeight: pw.FontWeight.bold,
                  color: headerColor,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                "Flutter developer",
                style: pw.TextStyle(
                  font: regularFont,
                  fontSize: 18,
                  fontStyle: pw.FontStyle.italic,
                  color: headerColor,
                ),
              ),
              pw.SizedBox(height: 10),

              // Contact Info in a Box with clickable links
              pw.Container(
                padding: const pw.EdgeInsets.all(8),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(
                    color: PdfColors.black,
                    width: 1,
                  ),
                ),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.UrlLink(
                      destination: 'amanboe1@gmail.com',
                      child: pw.Row(
                        children: [

                          pw.Text('amanboe1@gmail.com', style: pw.TextStyle(font: regularFont)),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: 'phone : 9643593430',
                      child: pw.Row(
                        children: [

                          pw.Text('9643593430', style: pw.TextStyle(font: regularFont)),
                        ],
                      ),
                    ),
                    pw.UrlLink(
                      destination: 'https://www.linkedin.com/in/aman-singh-423b1b192/',
                      child: pw.Row(
                        children: [

                          pw.Text('https://www.linkedin.com/in/aman-singh-423b1b192/', style: pw.TextStyle(font: regularFont)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 20),

          // Summary
          pw.Text(
            "As a passionate Flutter developer, I specialize in building high-performance, cross-platform mobile applications. With a focus on clean code and user-friendly design, I enjoy bringing ideas to life through intuitive and responsive apps. My goal is to deliver seamless experiences across both Android and iOS platforms.",
            style: pw.TextStyle(font: regularFont, color: bodyColor),
          ),
          pw.SizedBox(height: 20),

          // Experience
          pw.Text(
            "Projects",
            style: pw.TextStyle(
              font: customFont,
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
              color: headerColor,
            ),
          ),
          pw.Divider(color: lineColor),
          // Another experience item with date on the right
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Text(
                  "A Food Ordering App",
                  style: pw.TextStyle(font: regularFont, color: bodyColor,fontWeight:pw.FontWeight.bold),
                ),
              ),
              pw.Text(
                "2024 - present",
                style: pw.TextStyle(font: regularFont, color: bodyColor),
              ),
            ],
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 20),
            child: pw.Bullet(
              text: "Developed a Food Ordering Application using Flutter and integrated Razorpay for secure payment.",
              style: pw.TextStyle(font: regularFont, color: bodyColor),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 20),
            child: pw.Bullet(
              text: "Full-stack Mobile Development: Handled both front-end development and back-end integration with Firebase including user authentication, data storage, and order management.",


              style: pw.TextStyle(font: regularFont, color: bodyColor),
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Text(
                  "Time Capsule App",
                  style: pw.TextStyle(font: regularFont, color: bodyColor,fontWeight:pw.FontWeight.bold),
                ),
              ),
              pw.Text(
                "2024 - present",
                style: pw.TextStyle(font: regularFont, color: bodyColor),
              ),
            ],
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 20),
            child: pw.Bullet(
              text: "Developed a Time Capsule Application using Flutter: Designed and implemented an intuitive interface for users to create, store, and share memories in the form of text, images, and music.",


              style: pw.TextStyle(font: regularFont, color: bodyColor),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 20),
            child: pw.Bullet(
              text: "State Management: Combined BLoC and GetX for efficient state management, ensuring seamless user experience and optimal performance across different features.",

              style: pw.TextStyle(font: regularFont, color: bodyColor),
            ),
          ),

          // Education
          pw.Text(
            "Education",
            style: pw.TextStyle(
              font: customFont,
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
              color: headerColor,
            ),
          ),
          pw.Divider(color: lineColor),
          pw.Bullet(
            text: "High School (2021)",
            style: pw.TextStyle(font: regularFont, color: bodyColor),
          ),
          pw.Bullet(
            text: "Guru Govind Singh Indraprastha University (2022-2026)\nBachelor of Technology in Computer Science",
            style: pw.TextStyle(font: regularFont, color: bodyColor),
          ),
          pw.SizedBox(height: 20),

          // Skills (Split into two columns)
          pw.Text(
            "Skills",
            style: pw.TextStyle(
              font: customFont,
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
              color: headerColor,
            ),
          ),
          pw.Divider(color: lineColor),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Bullet(text: "Dart", style: pw.TextStyle(font: regularFont, color: bodyColor)),
                    pw.Bullet(text: "Flutter developer", style: pw.TextStyle(font: regularFont, color: bodyColor)),
                    pw.Bullet(text: "C++/SQL", style: pw.TextStyle(font: regularFont, color: bodyColor)),
                    pw.Bullet(text: "Communication Skills", style: pw.TextStyle(font: regularFont, color: bodyColor)),
                  ],
                ),
              ),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Bullet(text: "Problem Solving", style: pw.TextStyle(font: regularFont, color: bodyColor)),
                    pw.Bullet(text: "Git/Github", style: pw.TextStyle(font: regularFont, color: bodyColor)),
                    pw.Bullet(text: "DBMS/Firebase", style: pw.TextStyle(font: regularFont, color: bodyColor)),
                    pw.Bullet(text: "Html/Css", style: pw.TextStyle(font: regularFont, color: bodyColor)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  // Return the generated PDF as Uint8List
  final pdfBytes = await pdf.save();
  return Uint8List.fromList(pdfBytes);
}
