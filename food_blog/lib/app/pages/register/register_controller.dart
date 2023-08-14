import 'package:flutter/material.dart';
import 'package:food_blog/app/components/button/app_filled_corner_button_widget.dart';
import 'package:food_blog/app/components/loading/app_loading_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/components/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/data/auth_data.dart';
import 'package:food_blog/data/user_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';
import 'package:regexed_validator/regexed_validator.dart';

part 'register_page.dart';

class RegisterController extends GetxController {
  static const String resultOk = 'resultOk';
  static const String resultEmail = 'resultEmail';
  static const String resultPassword = 'resultPassword';

  String email = '';
  String password = '';
  String confirmPassword = '';
  String nickname = '';
  RxBool isObscurePassword = true.obs;
  RxBool isObscureConfirmPassword = true.obs;

  RxBool isLoading = false.obs;

  bool isValidated() {
    if (nickname.trim() == '') {
      const GetSnackBar(
        message: 'Vui lòng nhập danh xưng của bạn',
        duration: Duration(seconds: 2),
      ).show();
      return false;
    }
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
    if (confirmPassword.trim() == '') {
      const GetSnackBar(
        message: 'Vui lòng nhập mật khẩu xác nhận của bạn',
        duration: Duration(seconds: 2),
      ).show();
      return false;
    }
    if (password != confirmPassword) {
      const GetSnackBar(
        message: 'Mật khẩu xác nhận của bạn không khớp',
        duration: Duration(seconds: 2),
      ).show();
      return false;
    }
    return true;
  }

  void showDialogRegisterAccount() async {
    final result = await executeRegisterAccount();
    if (result == true) {
      Get.back(result: resultOk);
    }
  }

  Future<bool> executeRegisterAccount() async {
    if (isValidated()) {
      isLoading.value = true;
      bool result = false;
      result = await AuthData.instance().registerAccount(email, password);
      if (result == true) {
        UserData.instance().addUser(UserModel(
            email: email,
            nickname: nickname,
            loginMethod: LoginMethod.email.value));
      } else {
        const GetSnackBar(
          message: 'Email đã tồn tại',
          duration: Duration(seconds: 2),
        ).show();
      }
      isLoading.value = false;
      return result;
    }
    return false;
  }
}
