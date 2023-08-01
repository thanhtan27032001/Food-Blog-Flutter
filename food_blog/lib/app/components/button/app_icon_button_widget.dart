import 'package:flutter/material.dart';
import 'package:food_blog/app/configs/app_colors.dart';

class AppIconButtonWidget extends StatelessWidget {
  final Icon icon;
  final Function() onPressed;
  final Color? iconColor;
  final Color? backgroundColor;

  const AppIconButtonWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(icon.size != null ? icon.size!/2 : 1000),
      child: Material(
        color: backgroundColor ?? Colors.transparent,
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
          color: iconColor ?? AppColors.blackColor(),
        ),
      ),
    );
  }
}
