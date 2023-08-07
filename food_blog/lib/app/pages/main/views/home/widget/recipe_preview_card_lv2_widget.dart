import 'package:flutter/material.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/domain/models/base_model.dart';

class RecipePreviewCardLv2Widget extends StatefulWidget {
  final RecipeModel recipe;

  final double? cardWidth;
  final double? cardHeight;

  const RecipePreviewCardLv2Widget(this.recipe,
      {super.key, this.cardWidth, this.cardHeight});

  @override
  State<StatefulWidget> createState() {
    return _RecipePreviewCardLv2WidgetState();
  }
}

class _RecipePreviewCardLv2WidgetState
    extends State<RecipePreviewCardLv2Widget> {
  late final RecipeModel recipe;

  late final double? cardWidth;
  late final double? cardHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth ?? 200,
      height: cardHeight ?? 200,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.network(recipe.imageUrl ?? '', fit: BoxFit.cover),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        AppAvatarWidget(
                            avtUrl: recipe.author?.avatarUrl, size: 21),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          flex: 1,
                          child: AppTextBody3Widget()
                              .setText(recipe.author?.nickname)
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    recipe = widget.recipe;
    cardWidth = widget.cardWidth;
    cardHeight = widget.cardHeight;
  }
}