import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/configs/app_colors.dart';
import 'package:food_blog/models/recipe_model.dart';

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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.network(
                    'https://file.hstatic.net/200000303304/article/steak_10_b1b1397477ea4c8ca1f215989632a614_1024x1024.jpg',
                    fit: BoxFit.fill),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //TODO: separate favorite num widget
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: AppColors.grayColor(level: 0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: AppColors.primaryColor(level: 0),
                              size: 16,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text('12')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.favorite_border_rounded,
                      size: 16,
                    ),
                    Expanded(
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
