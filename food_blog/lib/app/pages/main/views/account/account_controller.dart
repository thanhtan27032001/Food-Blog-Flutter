import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/archivedRecipe/archived_recipe_controller.dart';
import 'package:food_blog/app/pages/followManagement/follow_management_controller.dart';
import 'package:food_blog/data/user_data.dart';
import 'package:get/get.dart';

part 'account_page.dart';

class AccountController extends GetxController {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut().then((value) {
      UserData.instance().setUserLogin(null);
      Get.offAndToNamed('/login');
    });
  }
}