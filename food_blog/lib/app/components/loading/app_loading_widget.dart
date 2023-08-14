import 'package:flutter/material.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';

class AppLoadingWidget extends StatelessWidget {
  final String? message;
  const AppLoadingWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: AppColors.secondaryColor(level: 2),
        ),
        const SizedBox(
          height: 8,
        ),
        AppTextBody1Widget().setText(message ?? 'Đang tải').build(context),
      ],
    );
  }
}