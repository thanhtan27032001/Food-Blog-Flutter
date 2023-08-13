import 'package:flutter/material.dart';
import 'package:food_blog/app/components/appBar/app_bar_widget.dart';
import 'package:food_blog/app/components/loading/app_loading_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/main/views/home/widget/recipe_preview_card_lv2_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/recipe_detail_controller.dart';
import 'package:food_blog/data/favorite_recipe_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

part 'favorite_recipe_page.dart';

class FavoriteRecipeController extends GetxController{
  Rxn<List<RecipeModel>> myFavoriteRecipeList = Rxn();

  @override
  void onInit() {
    super.onInit();
    getMyRecipeList();
  }

  void getMyRecipeList() async {
    myFavoriteRecipeList.value = await FavoriteRecipeData.instance().getMyFavoriteRecipeList();
  }

  void gotoRecipeDetail(int index) {
    Get.to(() => RecipeDetailPage(),
        arguments: myFavoriteRecipeList.value?[index].recipeId);
  }
}