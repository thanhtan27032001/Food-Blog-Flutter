import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/configs/app_colors.dart';
import 'package:food_blog/models/recipe_model.dart';
import 'package:food_blog/pages/main/views/home/widget/home_suggestion_widget.dart';
import 'package:food_blog/pages/main/views/home/widget/recipe_preview_card_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: AppColors.whiteColor(),
      pageBody: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // search bar
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.grayColor(level: 0)),
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: AppColors.grayColor(level: 2),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Gõ nguyên liệu để tìm',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: AppColors.grayColor(level: 2)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // receipt season suggest
            HomeSuggestionWidget(pageContext: context, title: 'Các nguyên liệu đang trong mùa',),

            // receipt season suggest
            HomeSuggestionWidget(pageContext: context, title: 'Các công thức từ người bạn đang theo dõi',),

            // receipt season suggest
            HomeSuggestionWidget(pageContext: context, title: 'Các công thức phổ biến',),

            // receipt season suggest
            HomeSuggestionWidget(pageContext: context, title: 'Các công thức mới nhất',),
          ],
        ),
      ),
    );
  }
}
