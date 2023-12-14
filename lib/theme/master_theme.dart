import 'package:flutter/material.dart';

class Mastertheme {
  Mastertheme();
  static ThemeData theme() {
    const greenColor = Color.fromRGBO(12, 43, 12, 1);
    const greenColorL = Color.fromRGBO(12, 115, 0, 1);
    const TextStyle textColor = TextStyle(color: greenColorL);
    return ThemeData(
      cardColor: greenColor,
      primaryColor: greenColorL,
      indicatorColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      highlightColor: Colors.white,
      fontFamily: 'SourceSans',
      textTheme: TextTheme(
          headlineMedium:
              textColor.copyWith(fontWeight: FontWeight.bold, fontSize: 25),
          headlineLarge:
              textColor.copyWith(fontWeight: FontWeight.bold, fontSize: 35),
          bodyMedium:
              textColor.copyWith(fontWeight: FontWeight.normal, fontSize: 20),
          bodySmall:
              textColor.copyWith(fontWeight: FontWeight.normal, fontSize: 16)),
    );
  }
}
