import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/component/button/app_filled_corner_button.dart';
import 'package:food_blog/component/mainPage/app_main_page_widget.dart';
import 'package:food_blog/component/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/config/app_colors.dart';
import 'package:food_blog/config/text_style.dart';
import 'package:food_blog/firebase_options.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_page.dart';
part 'widget/login_logo_widget.dart';
part 'widget/login_subtitle_widget.dart';

class LoginController extends GetxController{

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String username = "";
  String password = "";
  var isObscurePassword = true.obs;

  void loginWithGoogle() {
    _googleSignIn.signIn().then((value) {
      print(value!.photoUrl!.toString());
      print(value?.email);
    });
  }
}