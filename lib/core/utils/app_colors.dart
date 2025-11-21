import 'package:flutter/material.dart';

abstract class AppColors {
  static const primaryColor = Color(0xffFF8140);
  static const secondaryColor = Color(0xFF9A1B12);
  static const grey = Color(0xFFD1D3D4);
  static const gradient = LinearGradient(
    colors: [Color(0xFFFF100F), Color(0xFFFFC070)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
