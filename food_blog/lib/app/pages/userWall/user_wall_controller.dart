import 'package:flutter/material.dart';
import 'package:food_blog/app/components/appBar/app_bar_widget.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/button/app_icon_button_widget.dart';
import 'package:food_blog/app/components/loading/app_loading_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/main/views/home/widget/recipe_preview_card_lv2_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/recipe_detail_controller.dart';
import 'package:food_blog/data/favorite_recipe_data.dart';
import 'package:food_blog/data/user_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

part 'user_wall_page.dart';

class UserWallController extends GetxController {
  String? userId;
  Rxn<UserModel> userModel = Rxn();
  Rxn<List<RecipeModel>> myFavoriteRecipeList = Rxn();
  @override
  void onInit() {
    super.onInit();
    userId = Get.arguments;
    getUserData();
    getMyRecipeList();
  }

  Future<void> getUserData() async {
    if (userId != null) {
      userModel.value = await UserData.instance().getUserById(userId: userId!);
    }
  }

  Future<void> getMyRecipeList() async {
    myFavoriteRecipeList.value = await FavoriteRecipeData.instance().getMyFavoriteRecipeList();
    myFavoriteRecipeList.refresh();
  }

  void gotoRecipeDetail(int index) {
    Get.to(() => RecipeDetailPage(),
        arguments: myFavoriteRecipeList.value?[index].recipeId);
  }
}