import 'package:flutter/material.dart';
import 'package:food_blog/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/components/text/app_text_base_builder.dart';
import 'package:food_blog/configs/app_colors.dart';
import 'package:food_blog/pages/main/views/home/widget/home_suggestion_widget.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget {
  const HomeView({super.key});

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
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.grayColor(level: 0)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: AppColors.grayColor(level: 2),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      AppTextBody1Widget()
                          .setText('Gõ nguyên liệu để tìm')
                          .setTextAlign(TextAlign.start)
                          .setColor(AppColors.grayColor(level: 2))
                          .build(context),
                    ],
                  ),
                ),
              ),
            ),
            // receipt season suggest
            HomeSuggestionWidget(
              pageContext: context,
              title: 'Các nguyên liệu đang trong mùa',
            ),

            // receipt season suggest
            HomeSuggestionWidget(
              pageContext: context,
              title: 'Các công thức từ người bạn đang theo dõi',
            ),

            // receipt season suggest
            HomeSuggestionWidget(
              pageContext: context,
              title: 'Các công thức phổ biến',
            ),

            // receipt season suggest
            HomeSuggestionWidget(
              pageContext: context,
              title: 'Các công thức mới nhất',
            ),
          ],
        ),
      ),
    );
  }
}
