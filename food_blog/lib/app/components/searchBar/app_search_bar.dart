import 'package:flutter/material.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:get/get.dart';

class AppSearchBarWidget extends GetView {
  final String? hintText;
  final Function()? onPressed;

  const AppSearchBarWidget({super.key, this.hintText, this.onPressed, });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            AppColors.grayColor(level: 0)),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: AppColors.grayColor(level: 2),
            ),
            const SizedBox(
              width: 4,
            ),
            AppTextBody1Widget()
                .setText(hintText ?? 'Gõ nguyên liệu để tìm')
                .setTextAlign(TextAlign.start)
                .setColor(AppColors.grayColor(level: 2))
                .build(context),
          ],
        ),
      ),
    );
  }

}