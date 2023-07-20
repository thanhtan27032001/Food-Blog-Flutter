import 'package:flutter/material.dart';
import 'package:food_blog/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/models/recipe_comment.dart';

class RecipeCommentListWidget extends StatelessWidget {
  final List<RecipeComment> commentList;

  const RecipeCommentListWidget(this.commentList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tất cả tương tác'),
          const SizedBox(height: 8,),
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
                        avtUrl: commentList[index].user.avtUrl, size: 40),
                    const SizedBox(width: 4,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(commentList[index].user.name),
                          const SizedBox(height: 2,),
                          Text(commentList[index].comment)
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
