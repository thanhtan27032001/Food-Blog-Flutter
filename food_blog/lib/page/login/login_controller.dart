import 'package:flutter/material.dart';
import 'package:food_blog/component/button/app_filled_corner_button.dart';
import 'package:food_blog/component/mainPage/app_main_page_widget.dart';
import 'package:food_blog/component/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/config/app_colors.dart';
import 'package:food_blog/config/text_style.dart';
import 'package:food_blog/page/main/main_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_page.dart';

part 'widget/login_logo_widget.dart';

part 'widget/login_subtitle_widget.dart';

class LoginController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String username = "";
  String password = "";
  bool isObscurePassword = true;

  void loginWithGoogle(BuildContext context) {
    _googleSignIn.signIn().then(
      (value) {
        // print(value!.photoUrl!.toString());
        // print(value.email);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => const MainPage(),
          ),
        );
      },
    );
  }
}
