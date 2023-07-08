part of '../login_controller.dart';

class LoginLogoWidget extends StatelessWidget {
  const LoginLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Food',
            style: TextStyle(
              fontSize: AppTextStyle.fontSizeDisplay2,
              fontWeight: FontWeight.bold,
              color: AppColors.getPrimaryColor(),
            ),
          ),
          Text(
            'blog',
            style: TextStyle(
              fontSize: AppTextStyle.fontSizeDisplay2,
              fontWeight: FontWeight.bold,
              color: AppColors.getBlackColor(),
            ),
          ),
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