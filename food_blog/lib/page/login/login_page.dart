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
      statusBarColor: AppColors.getWhiteColor(),
      pageBackgroundColor: AppColors.getWhiteColor(),
      pageBody: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppStatusBarWidget(AppColors.getWhiteColor()),
          const LoginLogoWidget(),
          const LoginSubtitleWidget(),
        ],
      ),
    );
  }
}
