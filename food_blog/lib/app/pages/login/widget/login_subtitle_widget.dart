part of '../login_controller.dart';

class LoginSubtitleWidget extends StatelessWidget {
  const LoginSubtitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: AppTextBody2Widget()
          .setText('Khám phá nhiều hơn công thức mới\ndành riêng cho bạn')
          .setTextAlign(TextAlign.center)
          .setTextStyle(TextStyle(color: AppColors.grayColor(level: 2)))
          .build(context),
    );
  }
}
