import 'package:flutter/cupertino.dart';

class AppStatusBarWidget extends StatelessWidget {

  final Color _color;

  const AppStatusBarWidget(this._color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.top,
      width: double.infinity,
      color: _color,
    );
  }
}