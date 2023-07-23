part of 'app_text_base_builder.dart';

class AppTextDisplay2Widget extends AppTextBaseBuilder {
  @override
  Widget build(BuildContext context) {
    const orgTextStyle = TextStyle(fontSize: AppTextStyle.fontSizeDisplay2);
    if (_textStyle == null) {
      setTextStyle(orgTextStyle);
    } else {
      setTextStyle(
        _textStyle?.copyWith(fontSize: orgTextStyle.fontSize),
      );
    }
    return super.build(context);
  }

  @override
  AppTextDisplay2Widget setMaxLines(int? maxLines) {
    _maxLines = maxLines;
    return this;
  }

  @override
  AppTextDisplay2Widget setText(String? text) {
    _text = text;
    return this;
  }

  @override
  AppTextDisplay2Widget setTextAlign(TextAlign? textAlign) {
    _textAlign = textAlign;
    return this;
  }

  @override
  AppTextDisplay2Widget setTextOverFlow(TextOverflow? textOverflow) {
    _textOverflow = textOverflow;
    return this;
  }

  @override
  AppTextDisplay2Widget setTextStyle(TextStyle? textStyle) {
    _textStyle = textStyle;
    return this;
  }

  @override
  AppTextDisplay2Widget setColor(Color? color) {
    _color = color;
    return this;
  }
}
