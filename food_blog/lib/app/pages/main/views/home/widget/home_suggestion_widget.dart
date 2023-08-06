import 'package:flutter/material.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/pages/main/views/home/widget/recipe_preview_card_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/recipe_detail_controller.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

class HomeSuggestionWidget extends GetWidget {
  final String title;
  final List<RecipeModel> recipeList;

  const HomeSuggestionWidget({
    super.key,
    required this.title,
    required this.recipeList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: AppTextBody2Widget()
                .setText(title)
                .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                .build(context),
          ),
          Container(
            width: double.infinity,
            height: 180,
            margin: const EdgeInsets.only(top: 16),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: recipeList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => RecipeDetailPage(),
                        arguments: recipeList[index].recipeId);
                  },
                  child: RecipePreviewCardWidget(
                    recipeList[index],
                    cardWidth: 200,
                    cardHeight: 180,
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
