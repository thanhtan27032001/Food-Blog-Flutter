import 'package:flutter/material.dart';
import 'package:food_blog/app/components/appBar/app_bar_widget.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/button/app_icon_button_widget.dart';
import 'package:food_blog/app/components/loading/app_loading_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/main/views/home/widget/recipe_preview_card_lv2_widget.dart';
import 'package:food_blog/app/pages/recipeDetailLv2/recipe_detail_lv2_controller.dart';
import 'package:food_blog/data/recipe_data.dart';
import 'package:food_blog/data/user_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

part 'user_wall_page.dart';

class UserWallController extends GetxController {
  String? userId;
  Rxn<UserModel> userModel = Rxn();
  Rxn<List<RecipeModel>> recipeList = Rxn();

  @override
  Future<void> onInit() async {
    super.onInit();
    userId = Get.arguments;
    await getUserData();
    getUserRecipeList();
  }

  Future<void> getUserData() async {
    if (userId != null) {
      userModel.value = await UserData.instance().getUserById(userId: userId!);
    }
  }

  Future<void> getUserRecipeList() async {
    recipeList.value = await RecipeData.instance()
        .getOtherUserRecipeList(userId, author: userModel.value);
    recipeList.refresh();
  }

  void gotoRecipeDetail(int index) {
    Get.to(() => RecipeDetailLv2Page(),
        arguments: recipeList.value?[index].recipeId);
  }
}
