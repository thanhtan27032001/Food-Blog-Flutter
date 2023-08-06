import 'package:flutter/material.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/domain/models/base_model.dart';

class RecipePreviewCardWidget extends StatefulWidget {
  final RecipeModel recipe;

  final double cardWidth;
  final double cardHeight;

  const RecipePreviewCardWidget(this.recipe,
      {super.key, this.cardWidth = 200, this.cardHeight = 180});

  @override
  State<StatefulWidget> createState() {
    return _RecipePreviewCardWidgetState();
  }
}

class _RecipePreviewCardWidgetState extends State<RecipePreviewCardWidget> {
  late final RecipeModel recipe;

  late final double cardWidth;
  late final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.network(
                    recipe.imageUrl ?? '',
                    fit: BoxFit.fill),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //TODO: separate favorite num widget
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        color: AppColors.grayColor(level: 0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
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
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      Icons.favorite_border_rounded,
                      size: 16,
                    ),
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.bookmark_add_outlined,
                            size: 16,
                          )
                        ],
                      ),
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
