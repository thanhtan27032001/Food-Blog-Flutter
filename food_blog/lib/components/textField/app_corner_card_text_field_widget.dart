import 'package:flutter/material.dart';
import 'package:food_blog/configs/app_colors.dart';

class AppCornerCardTextFieldWidget extends StatelessWidget {
  late final ValueChanged<String> _onChange;
  late final bool? _autofocus;
  late final FocusNode? _focusNode;
  late final TextInputAction? _textInputAction;
  late final bool? _obscureText;
  late final ValueChanged<String>? _onFieldSubmitted;
  late final Icon? _leadingIcon;
  late final Icon? _suffixIcon;
  late final VoidCallback? _suffixIconOnPress;
  late final TextInputType? _inputType;
  late final double? _elevation;
  late final double? _borderRadius;
  late final Color? _backgroundColor;
  late final String? _hintText;
  late final int? _maxLine;
  late final String? _text;

  AppCornerCardTextFieldWidget(
      {super.key,
      required ValueChanged<String> onChange,
      bool? autofocus,
      FocusNode? focusNode,
      TextInputAction? textInputAction,
      bool? obscureText,
      ValueChanged<String>? onFieldSubmitted,
      Icon? leadingIcon,
      Icon? suffixIcon,
      VoidCallback? suffixIconOnPress,
      TextInputType? inputType,
      double? elevation,
      double? borderRadius,
      Color? backgroundColor,
      String? hintText,
      int? maxLine,
      String? text}) {
    _onChange = onChange;
    _autofocus = autofocus;
    _focusNode = focusNode;
    _textInputAction = textInputAction;
    _obscureText = obscureText;
    _onFieldSubmitted = onFieldSubmitted;
    _leadingIcon = leadingIcon;
    _suffixIcon = suffixIcon;
    _suffixIconOnPress = suffixIconOnPress;
    _inputType = inputType;
    _elevation = elevation;
    _borderRadius = borderRadius;
    _backgroundColor = backgroundColor;
    _hintText = hintText;
    _maxLine = maxLine;
    _text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius ?? 35),
      ),
      color: _backgroundColor ?? AppColors.whiteColor(),
      elevation: _elevation ?? 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            _leadingIcon != null
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: _leadingIcon!)
                : const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                initialValue: _text,
                onChanged: _onChange,
                autofocus: (_autofocus != null) ? _autofocus! : false,
                focusNode: _focusNode,
                textInputAction: _textInputAction,
                textAlign: TextAlign.left,
                obscureText: _obscureText ?? false,
                cursorColor: AppColors.secondaryColor(),
                onFieldSubmitted: _onFieldSubmitted,
                keyboardType: _inputType ?? TextInputType.text,
                maxLines: _obscureText == true ? 1 : _maxLine,
                decoration: InputDecoration(
                  hintText: _hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: _suffixIconOnPress,
              child: _suffixIcon != null
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: _suffixIcon!,
                    )
                  : const SizedBox(width: 8),
            )
          ],
        ),
      ),
    );
  }
}