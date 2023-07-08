import 'package:flutter/material.dart';
import 'package:food_blog/config/app_colors.dart';
import 'package:get/get.dart';

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
      TextInputType? inputType}) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      elevation: 2,
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
                onChanged: _onChange,
                autofocus: (_autofocus != null) ? _autofocus! : false,
                focusNode: _focusNode,
                textInputAction: _textInputAction,
                obscureText: _obscureText != null ? _obscureText! : false,
                cursorColor: AppColors.secondaryColor(),
                onFieldSubmitted: _onFieldSubmitted,
                keyboardType: _inputType,
                decoration: const InputDecoration(
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

// class _AppCornerCardTextFieldWidgetState extends State<AppCornerCardTextFieldWidget> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
// }
