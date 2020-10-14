import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    //we used static to not use a new copy of AppTheme
    primaryColor: Hexcolor('cc0001'),
  );
}