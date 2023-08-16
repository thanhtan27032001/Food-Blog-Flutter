import 'package:flutter/material.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final bool? isCenterTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? titleColor;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;

  const AppBarWidget({
    super.key,
    required this.title,
    this.isCenterTitle,
    this.leading,
    this.actions,
    this.titleColor,
    this.backgroundColor,
    this.bottom,
  });

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: AppTextBody1Widget().setText(title).setColor(titleColor).build(context),
      centerTitle: isCenterTitle,
      actions: actions,
      leading: leading,
      backgroundColor: backgroundColor ?? AppColors.primaryColor(),
      bottom: bottom,
    );
  }
}