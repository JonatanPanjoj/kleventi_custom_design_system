import 'package:flutter/material.dart';

class DSTypography {
  DSTypography._();

  static const String primaryFont = 'Roboto';

  // Font Weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;

  // Large Headline
  static const TextStyle largeHeadline = TextStyle(
    fontFamily: primaryFont,
    fontSize: 34.0,
    fontWeight: medium,
    letterSpacing: 0.25,
    color: Colors.black, // Replace with actual color
  );

  // Headline
  static const TextStyle headline = TextStyle(
    fontFamily: primaryFont,
    fontSize: 24.0,
    fontWeight: medium,
    letterSpacing: 0.15,
    color: Colors.black,
  );

  // Title
  static const TextStyle title = TextStyle(
    fontFamily: primaryFont,
    fontSize: 20.0,
    fontWeight: medium,
    letterSpacing: 0.15,
    color: Colors.black,
  );

  // Subtitle
  static const TextStyle subtitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16.0,
    fontWeight: regular,
    letterSpacing: 0.15,
    color: Colors.black,
  );

  // Body
  static const TextStyle body = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16.0,
    fontWeight: regular,
    letterSpacing: 0.5,
    color: Colors.black,
  );

  // Label
  static const TextStyle label = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12.0,
    fontWeight: regular,
    letterSpacing: 0.5,
    color: Colors.black,
  );
}
