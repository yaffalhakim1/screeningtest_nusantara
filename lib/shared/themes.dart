import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xff2C96F1);
Color secondaryColor = const Color(0xFFF2A62C);
Color textColor = const Color(0xff1E293B);
Color bgColor = const Color(0xffF5FAFF);
Color warningColor = const Color(0xffFFC700);
Color successColor = const Color(0xff4CBE4C);
Color errorColor = const Color(0xffE83121);
Color greyColor = const Color(0xff6B7280);

FontWeight medium = FontWeight.w500;
FontWeight bold = FontWeight.w700;
FontWeight light = FontWeight.w300;
FontWeight semibold = FontWeight.w600;
FontWeight normal = FontWeight.w400;

TextStyle regularTextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: textColor,
);
TextStyle titleTextStyle = GoogleFonts.poppins(
  fontSize: 32,
  // fontWeight: FontWeight.w700,
  color: textColor,
);
TextStyle subtitleTextStyle = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: textColor,
);

double defaultMargin = 32;
