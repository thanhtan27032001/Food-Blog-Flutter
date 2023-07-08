import 'package:flutter/material.dart';

class AppColors {
  static final List<Color> _primaryColor = [
    Color(int.parse("0xfff05545")),
    Color(int.parse("0xffb71c1c")),
    Color(int.parse("0xff7f0000"))
  ];

  static final List<Color> _secondaryColor = [
    Color(int.parse("0xff62efff")),
    Color(int.parse("0xff00bcd4")),
    Color(int.parse("0xff008ba3"))
  ];

  static final List<Color> _grayColor = [
    Color(int.parse("0xffEEEEEE")),
    Color(int.parse("0xffBDBDBD")),
    Color(int.parse("0xff757575")),
    Color(int.parse("0xff424242"))
  ];

  static final Color _whiteColor = Color(int.parse("0xffffffff"));

  static final Color _blackColor = Color(int.parse("0xff000000"));

  static Color primaryColor({int level = 1}) {
    return _primaryColor[level];
  }

  static Color secondaryColor({int level = 1}) {
    return _secondaryColor[level];
  }

  static Color grayColor({required int level}) {
    return _grayColor[level];
  }

  static Color blackColor() => _blackColor;

  static Color whiteColor() => _whiteColor;
}
