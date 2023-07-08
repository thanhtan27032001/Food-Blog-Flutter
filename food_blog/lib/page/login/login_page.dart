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
              leadingIcon: Icon(
                Icons.account_circle_outlined,
                color: AppColors.grayColor(level: 2),
              ),
              // suffixIcon: Icon(Icons.clear_rounded, color: AppColors.grayColor(level: 2)),
            ).build(context),
          ),
          // username text field
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: AppCornerCardTextFieldWidget(
              onChange: (value) => controller.password = value,
              leadingIcon: Icon(
                Icons.lock_outline_rounded,
                color: AppColors.grayColor(level: 2),
              ),
              suffixIcon:
                  Icon(Icons.visibility, color: AppColors.grayColor(level: 2)),
            ).build(context),
          ),
          // forgot password
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: GestureDetector(
              child: const Text(
                'Quên mật khẩu?',
                textAlign: TextAlign.right,
              ),
              onTap: () => print('forgot password'),
            ),
          ),
          // login with username password button
          Container(
            margin: const EdgeInsets.fromLTRB(16, 40, 16, 0),
            child: AppFilledCornerButton(
              text: "Đăng nhập",
              textColor: AppColors.whiteColor(),
              buttonColor: AppColors.primaryColor(),
              onPressed: () {},
            ),
          ),
          // or
          Container(
            margin: const EdgeInsets.fromLTRB(16, 40, 16, 40),
            width: double.infinity,
            child: Stack(
              children: [
                const Divider(thickness: 1),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: Colors.white,
                    child: const Text("Hoặc"),
                  ),
                )
              ],
            ),
          ),
          // login with google
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: AppFilledCornerButton(
              text: "Tiếp tục với Google",
              textColor: AppColors.blackColor(),
              buttonColor: AppColors.whiteColor(),
              icon: Image.asset(
                "assets/images/google_logo.png",
                width: 20,
                height: 20,
              ),
              onPressed: () {},
            ),
          ),
          // register suggestion
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 32,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Bạn chưa có tài khoản? ',
                            style: TextStyle(color: AppColors.blackColor())),
                        TextSpan(
                          text: 'Đăng ký',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor()),
                        ),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
