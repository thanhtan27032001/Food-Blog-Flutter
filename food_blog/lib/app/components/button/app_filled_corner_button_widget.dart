import 'package:flutter/material.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';

class AppFilledCornerButtonWidget extends StatelessWidget {
  late final String _text;
  late final Color _textColor;
  late final Color _buttonColor;
  late final VoidCallback _onPressed;
  late final Widget? _icon;

  AppFilledCornerButtonWidget(
      {super.key,
      required String text,
      required Color textColor,
      required Color buttonColor,
      required VoidCallback onPressed,
      Widget? icon}) {
    _text = text;
    _textColor = textColor;
    _buttonColor = buttonColor;
    _onPressed = onPressed;
    _icon = icon;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: _buttonColor,
        ),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Center(
                child: AppTextBody2Widget()
                    .setText(_text)
                    .setColor(_textColor)
                    .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                    .build(context),
              ),
              _icon != null
                  ? Positioned(left: 4, top: 8, bottom: 8, child: _icon!)
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
