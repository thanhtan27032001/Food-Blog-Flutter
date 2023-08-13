import 'package:flutter/material.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/domain/models/base_model.dart';

class RecipeReactWidget extends StatelessWidget {
  final List<RecipeCommentModel> commentList;
  final RecipeModel recipe;

  const RecipeReactWidget(this.commentList, this.recipe, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppTextBody2Widget()
                  .setText('Tất cả tương tác')
                  .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                  .build(context),
              // num of like
              const SizedBox(
                width: 4,
              ),
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
              // num of comment
              const SizedBox(
                width: 4,
              ),
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
                        Icons.comment,
                        color: AppColors.secondaryColor(level: 2),
                        size: 16,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      AppTextBody3Widget()
                          .setText(recipe.numOfComment.toString())
                          .build(context)
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: commentList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppAvatarWidget(
                        avtUrl: commentList[index].user?.avatarUrl, size: 40),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextBody2Widget()
                              .setText(commentList[index].user?.nickname)
                              .setTextStyle(
                                  const TextStyle(fontWeight: FontWeight.bold))
                              .build(context),
                          const SizedBox(
                            height: 2,
                          ),
                          AppTextBody2Widget()
                              .setText(commentList[index].comment)
                              .build(context),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
