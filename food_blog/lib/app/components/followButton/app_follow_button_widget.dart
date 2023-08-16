import 'package:flutter/material.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';

class AppFollowButtonWidget {
  final bool isFollowed;
  final Function() onPressed;

  AppFollowButtonWidget({this.isFollowed = false, required this.onPressed});

  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)))),
        backgroundColor: MaterialStateProperty.all(isFollowed == true ? AppColors.grayColor(level: 0) : AppColors.primaryColor()),
      ),
      child: AppTextBody2Widget()
          .setText(isFollowed == true ? 'Đang theo dõi' : 'Theo dõi')
          .setColor(isFollowed == true ? AppColors.grayColor(level: 3) : AppColors.whiteColor())
          .build(context),
    );
  }
}
