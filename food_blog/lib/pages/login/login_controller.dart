import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_blog/components/button/app_filled_corner_button.dart';
import 'package:food_blog/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/components/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/configs/app_colors.dart';
import 'package:google_sign_in/google_sign_in.dart';


import '../../configs/text_style.dart';

part 'login_page.dart';

part 'widget/login_logo_widget.dart';

part 'widget/login_subtitle_widget.dart';

class LoginController {

  String username = "";
  String password = "";
  bool isObscurePassword = true;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // void signInWithGoogle(BuildContext context) {
  //   executeSignInWithGoogle();
  // }
}
