import 'package:flutter/material.dart';
import 'package:food_blog/app/pages/main/views/home/home_controller.dart';
import 'package:food_blog/app/pages/main/views/home/widget/recipe_preview_card_lv2_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/recipe_detail_controller.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

class HomeSuggestionWidget extends GetWidget<HomeController> {
  final List<RecipeModel> recipeList;

  @override
  final controller = Get.put(HomeController());

  HomeSuggestionWidget({
    super.key,
    required this.recipeList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shrinkWrap: true,
        itemCount: recipeList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => RecipeDetailPage(),
                  arguments: recipeList[index].recipeId);
            },
            child: RecipePreviewCardLv2Widget(
              recipeList[index],
              cardWidth: 200,
              cardHeight: 200,
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
