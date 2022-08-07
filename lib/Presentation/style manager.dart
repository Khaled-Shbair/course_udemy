import 'package:course_udemy/Presentation/fonts%20manager.dart';
import 'package:flutter/material.dart';

class StyleManager {
  // private method
  TextStyle _textStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: FontFamily.fontFamily,
    );
  }

// light style
  TextStyle getLightStyle(
      {double fontSize = FontSizeManager.s12, required Color color}) {
    return _textStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.light,
      color: color,
    );
  }

  // bold style
  TextStyle getBoldStyle(
      {double fontSize = FontSizeManager.s14, required Color color}) {
    return _textStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.bold,
      color: color,
    );
  }
}
