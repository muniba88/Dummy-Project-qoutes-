import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle heading = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle subheading = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle body = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static TextStyle title = GoogleFonts.poppins(
    fontSize: 34,
    fontWeight: FontWeight.bold,
  );
  static TextStyle splash = GoogleFonts.poppins(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}