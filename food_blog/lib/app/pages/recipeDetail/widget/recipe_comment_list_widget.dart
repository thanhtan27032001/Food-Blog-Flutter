import 'package:flutter/material.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/domain/models/recipe_comment_model.dart';

class RecipeCommentListWidget extends StatelessWidget {
  final List<RecipeCommentModel> commentList;

  const RecipeCommentListWidget(this.commentList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextBody2Widget()
              .setText('Tất cả tương tác')
              .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
              .build(context),
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
                        avtUrl: commentList[index].user.avatarUrl, size: 40),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextBody2Widget()
                              .setText(commentList[index].user.nickname)
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
