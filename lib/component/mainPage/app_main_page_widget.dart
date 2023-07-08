import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppMainPageWidget extends StatelessWidget {
  late final Color _statusBarColor;
  late final Color _pageBackgroundColor;
  late final Widget _pageBody;

  AppMainPageWidget(
      {super.key,
      required statusBarColor,
      required pageBackgroundColor,
      required pageBody}) {
    _statusBarColor = statusBarColor;
    _pageBackgroundColor = pageBackgroundColor;
    _pageBody = pageBody;
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            _isStatusBarColorBright() ? Brightness.dark : Brightness.light,
        statusBarColor: _statusBarColor,
      ),
    );
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: _pageBackgroundColor,
          child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: (_pageBody),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
