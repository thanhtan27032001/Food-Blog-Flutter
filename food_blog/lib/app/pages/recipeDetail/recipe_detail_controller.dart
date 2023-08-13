import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/button/app_icon_button_widget.dart';
import 'package:food_blog/app/components/loading/app_loading_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/data/comment_recipe_data.dart';
import 'package:food_blog/data/favorite_recipe_data.dart';
import 'package:food_blog/data/recipe_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:food_blog/app/pages/recipeDetail/widget/app_expansion_panel.dart';
import 'package:food_blog/app/pages/recipeDetail/widget/recipe_comment_list_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/widget/recipe_ingredient_list_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/widget/recipe_step_list_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/widget/recipe_summary_card.dart';
import 'package:get/get.dart';

part 'recipe_detail_page.dart';

class RecipeDetailController extends GetxController {
  Rxn<RecipeModel> recipeModel = Rxn();
  List<RecipeCommentModel> commentList = [];
  late final String? recipeId;

  @override
  void onInit() {
    super.onInit();
    recipeId = Get.arguments;
    getRecipeDetail();
  }

  Future<void> getRecipeDetail() async {
    if (recipeId != null) {
      commentList.addAll(await CommentRecipeData.instance().getRecipeCommentList(recipeId));
      recipeModel.value = await RecipeData.instance()
          .getRecipeDetailWithAuthor(recipeId: recipeId!);
    }
  }

  Future<void> changeFavoriteStatus() async {
    recipeModel.value?.favoriteRecipeId = await FavoriteRecipeData.instance().changeFavoriteStatus(recipeId,
        favoriteRecipeId: recipeModel.value?.favoriteRecipeId);
    recipeModel.refresh();
  }
}
