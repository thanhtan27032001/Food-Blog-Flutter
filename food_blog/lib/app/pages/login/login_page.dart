part of 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  final LoginController controller = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.whiteColor(),
      pageBackgroundColor: AppColors.whiteColor(),
      resizeToAvoidBottomInset: false,
      pageBody: Obx(() {
        if (controller.isLoading.value == false) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // AppStatusBarWidget(AppColors.getWhiteColor()),
              const LoginLogoWidget(),
              const LoginSubtitleWidget(),
              // email text field
              Container(
                margin: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                child: AppCornerCardTextFieldWidget(
                  hintText: 'Email',
                  onChange: (value) => controller.email = value,
                  text: controller.email,
                  leadingIcon: Icon(
                    Icons.account_circle_outlined,
                    color: AppColors.grayColor(level: 2),
                  ),
                ),
              ),
              // password text field
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Obx(
                  () => AppCornerCardTextFieldWidget(
                    hintText: 'Mật khẩu',
                    text: controller.password,
                    onChange: (value) => controller.password = value,
                    leadingIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.grayColor(level: 2),
                    ),
                    suffixIcon: Icon(
                      controller.isObscurePassword.value
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      color: AppColors.grayColor(level: 2),
                    ),
                    obscureText: controller.isObscurePassword.value,
                    suffixIconOnPress: () {
                      controller.isObscurePassword.value =
                          !controller.isObscurePassword.value;
                    },
                  ),
                ),
              ),
              // forgot password
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      child: AppTextBody2Widget()
                          .setText('Quên mật khẩu?')
                          .setTextAlign(TextAlign.right)
                          .build(context),
                      onTap: () => print('forgot password'),
                    )
                  ],
                ),
              ),
              // login with username password button
              Container(
                margin: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                child: AppFilledCornerButtonWidget(
                  text: "Đăng nhập",
                  textColor: AppColors.whiteColor(),
                  buttonColor: AppColors.primaryColor(),
                  onPressed: () {
                    controller.loginWithAccount();
                  },
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
                  return AppFilledCornerButtonWidget(
                    text: "Tiếp tục với Google",
                    textColor: AppColors.blackColor(),
                    buttonColor: AppColors.whiteColor(),
                    icon: SvgPicture.asset(
                      'assets/svgs/google_logo.svg',
                      width: 20,
                      height: 20,
                    ),
                    onPressed: () {
                      controller.signInWithGoogle(context);
                    },
                  );
                }),
              ),
              // register suggestion
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () {
                    controller.gotoRegisterPage();
                  },
                  child: RichText(
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
                  ),
                ),
              ),
            ],
          );
        } else {
          return const AppLoadingWidget(message: 'Đang đăng nhập',);
        }
      }),
    );
  }
}
