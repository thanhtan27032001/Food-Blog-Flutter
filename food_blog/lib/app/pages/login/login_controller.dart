import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_blog/app/components/button/app_filled_corner_button_widget.dart';
import 'package:food_blog/app/components/loading/app_loading_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/components/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/main/main_controller.dart';
import 'package:food_blog/app/pages/register/register_controller.dart';
import 'package:food_blog/data/auth_data.dart';
import 'package:food_blog/data/user_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';
import 'package:regexed_validator/regexed_validator.dart';

part 'login_page.dart';

part 'widget/login_logo_widget.dart';

part 'widget/login_subtitle_widget.dart';

class LoginController extends GetxController {
  String email = "";
  String password = "";
  RxBool isObscurePassword = true.obs;
  RxBool isLoading = false.obs;

  Future<void> signInWithGoogle(BuildContext context) async {
    isLoading.value = true;
    UserCredential userCredential =
        await AuthData.instance().signInWithGoogle();
    if (userCredential.user != null) {
      await UserData.instance().addUser(
        UserModel(
            email: userCredential.user?.email ?? '',
            nickname: userCredential.user?.displayName ?? 'No name',
            avatarUrl: userCredential.user?.photoURL),
      );
      UserModel? userLogin = await UserData.instance()
          .getUserByEmail(email: userCredential.user?.email ?? '');
      UserData.instance().setUserLogin(userLogin!);
      Get.off(MainPage());
    } else {
      print('đang nhập google thất bại');
    }
    isLoading.value = false;
  }

  Future<void> loginWithAccount() async {
    if (isValidated()) {
      isLoading.value = true;
      UserCredential? userCredential =
      await AuthData.instance().loginWithAccount(email, password);
      if (userCredential != null) {
        UserModel? userLogin = await UserData.instance()
            .getUserByEmail(email: userCredential.user?.email ?? '');
        UserData.instance().setUserLogin(userLogin!);
        Get.off(MainPage());
      }
      else {
        const GetSnackBar(
          message: 'Tài khoản hoặc mật khẩu không chính xác :(',
          duration: Duration(seconds: 2),
        ).show();
      }
      isLoading.value = false;
    }
  }

  Future<void> gotoRegisterPage() async {
    //TODO: get email, password if register success
    // final result = await Get.to(() => RegisterPage());
    // if (result[RegisterController.resultEmail] != null && result[RegisterController.resultPassword] != null) {
    //
    // }
    Get.to(() => RegisterPage());
  }

  bool isValidated() {
    if (email.trim() == '') {
      const GetSnackBar(
        message: 'Vui lòng nhập email của bạn',
        duration: Duration(seconds: 2),
      ).show();
      return false;
    }
    if (!validator.email(email)) {
      const GetSnackBar(
        message: 'Email của bạn không hợp lệ',
        duration: Duration(seconds: 2),
      ).show();
      return false;
    }
    if (password.trim() == '') {
      const GetSnackBar(
        message: 'Vui lòng nhập mật khẩu của bạn',
        duration: Duration(seconds: 2),
      ).show();
      return false;
    }
    return true;
  }
}
