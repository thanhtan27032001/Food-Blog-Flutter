part of 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({super.key});

  @override
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
        statusBarColor: AppColors.whiteColor(),
        pageBackgroundColor: AppColors.whiteColor(),
        resizeToAvoidBottomInset: false,
        pageBody: _body(context));
  }

  Widget _body(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value == false) {
        return Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // logo
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextDisplay2Widget()
                            .setText('Đăng ký')
                            .setColor(AppColors.blackColor())
                            .setTextStyle(
                            const TextStyle(fontWeight: FontWeight.bold))
                            .build(context),
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: Image.asset('assets/images/login_logo.png'),
                        )
                      ],
                    ),
                  ),
                  // nickname text field
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                    child: AppCornerCardTextFieldWidget(
                      hintText: 'Danh xưng',
                      onChange: (value) => controller.nickname = value,
                      leadingIcon: Icon(
                        Icons.account_circle_outlined,
                        color: AppColors.grayColor(level: 2),
                      ),
                    ),
                  ),
                  // email text field
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: AppCornerCardTextFieldWidget(
                      hintText: 'Email',
                      onChange: (value) => controller.email = value,
                      leadingIcon: Icon(
                        Icons.email_outlined,
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Obx(
                          () => AppCornerCardTextFieldWidget(
                        hintText: 'Xác nhận mật khẩu',
                        onChange: (value) => controller.confirmPassword = value,
                        leadingIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: AppColors.grayColor(level: 2),
                        ),
                        suffixIcon: Icon(
                          controller.isObscureConfirmPassword.value
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          color: AppColors.grayColor(level: 2),
                        ),
                        obscureText: controller.isObscureConfirmPassword.value,
                        suffixIconOnPress: () {
                          controller.isObscureConfirmPassword.value =
                          !controller.isObscureConfirmPassword.value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                print('Back back');
                Get.back();
              },
            ),
            // register button
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 40),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: AppFilledCornerButtonWidget(
                  text: "Đăng ký",
                  textColor: AppColors.whiteColor(),
                  buttonColor: AppColors.primaryColor(),
                  onPressed: () {controller.showDialogRegisterAccount();},
                ),
              ),
            ),
          ],
        );
      }
      else {
        return const AppLoadingWidget(message: 'Đang đăng ký',);
      }
    });
  }
}
