import 'package:flutter/material.dart';
import 'package:food_blog/app/configs/app_text_style.dart';

part 'app_text_display_1_widget.dart';
part 'app_text_display_2_widget.dart';
part 'app_text_heading_1_widget.dart';
part 'app_text_heading_2_widget.dart';
part 'app_text_heading_3_widget.dart';
part 'app_text_body_1_widget.dart';
part 'app_text_body_2_widget.dart';
part 'app_text_body_3_widget.dart';

abstract class AppTextBaseBuilder {
  String? _text;
  TextStyle? _textStyle;
  TextAlign? _textAlign;
  int? _maxLines;
  TextOverflow? _textOverflow;
  Color? _color;

  AppTextBaseBuilder setText(String? text);

  AppTextBaseBuilder setTextStyle(TextStyle? textStyle);

  AppTextBaseBuilder setTextAlign(TextAlign? textAlign);

  AppTextBaseBuilder setMaxLines(int? maxLines);

  AppTextBaseBuilder setTextOverFlow(TextOverflow? textOverflow);

  AppTextBaseBuilder setColor(Color? color);

  @protected
  Widget build(BuildContext context) {
    final textStyle = _textStyle?.copyWith(color: _color ?? _textStyle?.color);
    return Text(
      _text ?? '-',
      textAlign: _textAlign,
      style: textStyle,
      maxLines: _maxLines,
      overflow: _textOverflow,
    );
  }
}
