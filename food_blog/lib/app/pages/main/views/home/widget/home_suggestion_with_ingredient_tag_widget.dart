import 'package:flutter/material.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

class HomeSuggestionWithTagListWidget extends GetWidget {
  final String title;
  final List<IngredientTagModel> ingredientTagList;
  final List<RecipeModel> recipeList;
  final Function(String)? onTagPressed;

  const HomeSuggestionWithTagListWidget({
    super.key,
    required this.title,
    required this.ingredientTagList,
    required this.recipeList,
    this.onTagPressed
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
          Wrap(
            direction: Axis.horizontal,
            children: List.generate(
              ingredientTagList.length,
              (index) {
                return InkWell(
                  onTap: () {
                    onTagPressed?.call(ingredientTagList[index].tag ?? '');
                  },
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    elevation: 2,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor(),
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          AppAvatarWidget(
                                  avtUrl: ingredientTagList[index].imageUrl,
                                  size: 24)
                              .build(context),
                          const SizedBox(
                            width: 8,
                          ),
                          AppTextBody2Widget()
                              .setText(ingredientTagList[index].name)
                              .build(context),
                          const SizedBox(
                            width: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
