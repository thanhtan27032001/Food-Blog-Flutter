part of '../login_controller.dart';

class LoginLogoWidget extends StatelessWidget {
  const LoginLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextDisplay2Widget()
              .setText('Food')
              .setColor(AppColors.primaryColor())
              .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
              .build(context),
          AppTextDisplay2Widget()
              .setText('blog')
              .setColor(AppColors.blackColor())
              .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
              .build(context),
          SizedBox(
            width: 45,
            height: 45,
            child: Image.asset('assets/images/login_logo.png'),
          )
        ],
      ),
    );
  }
}
