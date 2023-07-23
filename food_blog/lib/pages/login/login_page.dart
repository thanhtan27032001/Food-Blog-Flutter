part of 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = LoginController();

  _LoginPageState();

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
            ),
          ),
          // password text field
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: AppCornerCardTextFieldWidget(
              onChange: (value) => controller.password = value,
              leadingIcon: Icon(
                Icons.lock_outline_rounded,
                color: AppColors.grayColor(level: 2),
              ),
              suffixIcon: Icon(
                controller.isObscurePassword
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                color: AppColors.grayColor(level: 2),
              ),
              obscureText: controller.isObscurePassword,
              suffixIconOnPress: () {
                setState(() {
                  controller.isObscurePassword = !controller.isObscurePassword;
                });
              },
            ),
          ),
          // forgot password
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: GestureDetector(
              child: AppTextBody2Widget()
                  .setText('Quên mật khẩu?')
                  .setTextAlign(TextAlign.right)
                  .build(context),
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
            child: Builder(builder: (context) {
              return AppFilledCornerButton(
                text: "Tiếp tục với Google",
                textColor: AppColors.blackColor(),
                buttonColor: AppColors.whiteColor(),
                icon: SvgPicture.asset(
                  'assets/svgs/google_logo.svg',
                  width: 20,
                  height: 20,
                ),
                onPressed: () {
                  controller.signInWithGoogle();
                },
              );
            }),
          ),
          // register suggestion
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Bạn chưa có tài khoản? ',
                            style: TextStyle(color: AppColors.blackColor())),
                        TextSpan(
                          text: 'Đăng ký',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor()),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
