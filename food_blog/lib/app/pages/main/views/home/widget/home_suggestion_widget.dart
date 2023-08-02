import 'package:flutter/material.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/pages/main/views/home/widget/recipe_preview_card_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/recipe_detail_page.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

class HomeSuggestionWidget extends GetWidget {
  final BuildContext pageContext;
  final String title;

  const HomeSuggestionWidget(
      {super.key, required this.pageContext, required this.title});

  @override
  // State<StatefulWidget> createState() => HomeSuggestionWidgetState();

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
              itemCount: 20,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      RecipeDetailPage(
                        RecipeModel(
                          title: '',
                          author:
                              UserModel(email: 'email', nickname: 'nickname'),
                          imageUrl: '',
                        ),
                      ),
                    );
                    // Navigator.push(
                    //     pageContext,
                    //     MaterialPageRoute(
                    //       builder: (context) => RecipeDetailPage(RecipeModel()),
                    //     ));
                  },
                  child: RecipePreviewCardWidget(
                    RecipeModel(
                      title: '',
                      author:
                      UserModel(email: 'email', nickname: 'nickname'),
                      imageUrl: '',
                    ),
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

// class HomeSuggestionWidgetState extends State<HomeSuggestionWidget> {
//   late BuildContext pageContext;
//   late String title;
//
//   @override
//   void initState() {
//     super.initState();
//     pageContext = widget.pageContext;
//     title = widget.title;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 32),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16),
//             child: AppTextBody2Widget()
//                 .setText(title)
//                 .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
//                 .build(context),
//           ),
//           Container(
//             width: double.infinity,
//             height: 180,
//             margin: const EdgeInsets.only(top: 16),
//             child: ListView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               itemCount: 20,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigator.push(
//                     //     pageContext,
//                     //     MaterialPageRoute(
//                     //       builder: (context) => RecipeDetailPage(RecipeModel()),
//                     //     ));
//                   },
//                   child: RecipePreviewCardWidget(
//                     RecipeModel(),
//                     cardWidth: 200,
//                     cardHeight: 180,
//                   ),
//                 );
//               },
//               scrollDirection: Axis.horizontal,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
