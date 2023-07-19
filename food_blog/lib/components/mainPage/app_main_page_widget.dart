import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:food_blog/configs/theme_style.dart';

class AppMainPageWidget extends StatelessWidget {
  late final Color _statusBarColor;
  late final Color _pageBackgroundColor;
  late final Widget _pageBody;
  late final BottomNavigationBar? _bottomNavigationBar;

  AppMainPageWidget(
      {super.key,
      required statusBarColor,
      required pageBackgroundColor,
      required pageBody,
      BottomNavigationBar? bottomNavigationBar}) {
    _statusBarColor = statusBarColor;
    _pageBackgroundColor = pageBackgroundColor;
    _pageBody = pageBody;
    _bottomNavigationBar = bottomNavigationBar;
  }

  bool _isStatusBarColorBright() {
    double grayscale = (0.299 * _statusBarColor.red +
        0.587 * _statusBarColor.green +
        0.114 * _statusBarColor.blue);
    if (grayscale > 128) {
      return true;
    }
    return false;
  }

  void _customStatusBar(){
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
        _isStatusBarColorBright() ? Brightness.dark : Brightness.light,
        statusBarColor: _statusBarColor,
      ),
    );
  }

  Future<void> _setOptimalDisplayMode() async {
    final List<DisplayMode> supported = await FlutterDisplayMode.supported;
    final DisplayMode active = await FlutterDisplayMode.active;

    final List<DisplayMode> sameResolution = supported.where(
            (DisplayMode m) => m.width == active.width
            && m.height == active.height).toList()..sort(
            (DisplayMode a, DisplayMode b) =>
            b.refreshRate.compareTo(a.refreshRate));

    final DisplayMode mostOptimalMode = sameResolution.isNotEmpty
        ? sameResolution.first
        : active;

    await FlutterDisplayMode.setPreferredMode(mostOptimalMode);
  }

  @override
  Widget build(BuildContext context) {
    _customStatusBar();
    _setOptimalDisplayMode();
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: _pageBackgroundColor,
            child: Container(
              child: (_pageBody),
            ),
          ),
        ),
        bottomNavigationBar: _bottomNavigationBar,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
