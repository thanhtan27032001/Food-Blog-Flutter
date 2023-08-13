import 'package:flutter/material.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:food_blog/utils/format_time_facade.dart';
import 'package:get/get.dart';

class MyRecipePreviewCardWidget extends GetView {
  final RecipeModel recipe;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) optionList;

  const MyRecipePreviewCardWidget(this.recipe,
      {super.key, required this.optionList});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: SizedBox(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child:
                        Image.network(recipe.imageUrl ?? '', fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppTextBody1Widget()
                          .setText(recipe.title)
                          .setTextStyle(
                              const TextStyle(fontWeight: FontWeight.bold))
                          .build(context),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            recipe.status == RecipeStatus.public.value
                                ? Icons.public_rounded
                                : Icons.lock_outline_rounded,
                            size: 16,
                          ),
                          const SizedBox(width: 2,),
                          Expanded(
                            flex: 1,
                            child: AppTextBody3Widget()
                                .setText(FormatTimeFacade.getDisplayTime(recipe.updateDate))
                                .setTextOverFlow(TextOverflow.ellipsis)
                                .build(context),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              color: AppColors.grayColor(level: 0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: AppColors.primaryColor(level: 0),
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  AppTextBody3Widget()
                                      .setText(recipe.numOfLike.toString())
                                      .build(context)
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                right: 0,
                child: PopupMenuButton(
                  elevation: 8,
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  itemBuilder: optionList,
                )),
          ],
        ),
      ),
    );
  }
}
