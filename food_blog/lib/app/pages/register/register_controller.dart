import 'package:flutter/material.dart';
import 'package:food_blog/app/components/button/app_filled_corner_button_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/components/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/data/auth_data.dart';
import 'package:food_blog/data/user_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

part 'register_page.dart';

class RegisterController extends GetxController {
  static const String resultEmail = 'resultEmail';
  static const String resultPassword = 'resultPassword';

  String email = '';
  String password = '';
  String confirmPassword = '';
  String nickname = '';
  RxBool isObscurePassword = true.obs;
  RxBool isObscureConfirmPassword = true.obs;

  void showDialogRegisterAccount() async {
    final result = await executeRegisterAccount();
    if (result == true){
      Get.back();
    }
  }

  Future<bool> executeRegisterAccount() async {
    bool result = false;
    result = await AuthData.instance().registerAccount(email, password);
    if (result == true) {
      UserData.instance().addUser(UserModel(email: email, nickname: nickname));
    }
    return result;
  }
}