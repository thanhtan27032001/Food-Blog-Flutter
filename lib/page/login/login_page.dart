part of 'login_controller.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.whiteColor(),
      pageBackgroundColor: AppColors.whiteColor(),
      pageBody: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // AppStatusBarWidget(AppColors.getWhiteColor()),
          const LoginLogoWidget(),
          const LoginSubtitleWidget(),
          // username text field
          Container(
            margin: const EdgeInsets.fromLTRB(16, 40, 16, 0),
            child: AppCornerCardTextFieldWidget(
              onChange: (value) => controller.username = value,
              leadingIcon: Icon(Icons.account_circle_outlined, color: AppColors.grayColor(level: 2),),
              // suffixIcon: Icon(Icons.clear_rounded, color: AppColors.grayColor(level: 2)),
            ).build(context),
          ),
          // username text field
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: AppCornerCardTextFieldWidget(
              onChange: (value) => controller.password = value,
              leadingIcon: Icon(Icons.lock_outline_rounded, color: AppColors.grayColor(level: 2),),
              suffixIcon: Icon(Icons.visibility, color: AppColors.grayColor(level: 2)),
            ).build(context),
          ),
        ],
      ),
    );
  }
}
