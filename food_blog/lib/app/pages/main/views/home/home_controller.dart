import 'package:flutter/material.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/main/views/home/widget/home_suggestion_widget.dart';
import 'package:food_blog/data/recipe_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

part 'home_page.dart';

class HomeController extends GetxController {
  final Rxn<List<RecipeModel>> recipeNewestList = Rxn();
  final Rxn<List<RecipeModel>> recipePopularList = Rxn();

  @override
  void onInit() async {
    super.onInit();
    getRecipeNewestList();
    getRecipePopularList();
  }

  Future<void> getRecipeNewestList() async {
    recipeNewestList.value = await RecipeData.instance().getNewestRecipeList();
  }

  Future<void> getRecipePopularList() async {
    recipePopularList.value = await RecipeData.instance().getPopularRecipeList();
  }
}