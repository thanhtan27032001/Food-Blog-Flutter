 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppMainPageWidget extends StatelessWidget {
  late final Color _statusBarColor;
  late final Color _pageBackgroundColor;
  late final Widget _pageBody;
  late final BottomNavigationBar? _bottomNavigationBar;
  late final AppBar? _appbar;
  late final bool? _resizeToAvoidBottomInset;

  AppMainPageWidget({super.key,
    required statusBarColor,
    required pageBackgroundColor,
    required pageBody,
    BottomNavigationBar? bottomNavigationBar,
    AppBar? appbar,
    bool? resizeToAvoidBottomInset}) {
    _statusBarColor = statusBarColor;
    _pageBackgroundColor = pageBackgroundColor;
    _pageBody = pageBody;
    _bottomNavigationBar = bottomNavigationBar;
    _appbar = appbar;
    _resizeToAvoidBottomInset = resizeToAvoidBottomInset;
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

  void _customStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
        _isStatusBarColorBright() ? Brightness.dark : Brightness.light,
        statusBarColor: _statusBarColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _customStatusBar();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        home: Scaffold(
          appBar: _appbar,
          resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
          body: SafeArea(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              color: _pageBackgroundColor,
              child: Container(
                child: (_pageBody),
              ),
            ),
          ),
          bottomNavigationBar: _bottomNavigationBar,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
