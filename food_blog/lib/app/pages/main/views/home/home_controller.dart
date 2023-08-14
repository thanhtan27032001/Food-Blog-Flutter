import 'package:flutter/material.dart';
import 'package:food_blog/app/components/loading/app_loading_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/main/views/home/widget/home_suggestion_widget.dart';
import 'package:food_blog/app/pages/main/views/home/widget/home_suggestion_with_ingredient_tag_widget.dart';
import 'package:food_blog/app/pages/main/views/home/widget/recipe_preview_card_lv2_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/recipe_detail_controller.dart';
import 'package:food_blog/data/ingredient_data.dart';
import 'package:food_blog/data/recipe_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

part 'home_page.dart';

class HomeController extends GetxController {
  final Rxn<List<IngredientTagModel>> ingredientTagList = Rxn();
  final Rxn<List<RecipeModel>> recipeByIngredientList = Rxn();
  final Rxn<List<RecipeModel>> recipeNewestList = Rxn();
  final Rxn<List<RecipeModel>> recipePopularList = Rxn();

  @override
  void onInit() async {
    super.onInit();
    getIngredientTagListThisSeason();
    getRecipeNewestList();
    getRecipePopularList();
  }

  Future<void> getIngredientTagListThisSeason() async {
    recipeByIngredientList.value = null;
    ingredientTagList.value = await IngredientData.instance().searchTagByKeyword(keyword: ' ');
    if (ingredientTagList.value!.isNotEmpty) {
      getRecipeIngredientTagList(ingredientTagList.value![0].tag ?? '');
    }
  }

  Future<void> getRecipeIngredientTagList(String tag) async {
    recipeByIngredientList.value = null;
    recipeByIngredientList.refresh();

    recipeByIngredientList.value = await RecipeData.instance().getRecipeByIngredientList(tag);
    recipeByIngredientList.refresh();
  }

  Future<void> getRecipeNewestList() async {
    recipeByIngredientList.value = null;
    recipeNewestList.value = await RecipeData.instance().getNewestRecipeList();
  }

  Future<void> getRecipePopularList() async {
    recipePopularList.value = await RecipeData.instance().getPopularRecipeList();
  }
}