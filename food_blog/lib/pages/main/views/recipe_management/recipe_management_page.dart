import 'package:flutter/material.dart';
import 'package:food_blog/components/button/app_icon_button_widget.dart';
import 'package:food_blog/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/components/text/app_text_base_builder.dart';
import 'package:food_blog/configs/app_colors.dart';
import 'package:food_blog/pages/main/views/recipe_management/recipe_management_controller.dart';

class RecipeManagementPage extends StatefulWidget {
  const RecipeManagementPage({super.key});

  @override
  State<StatefulWidget> createState() => RecipeManagementPageState();
}

class RecipeManagementPageState extends State<RecipeManagementPage> {
  final RecipeManagementController controller = RecipeManagementController();

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: AppColors.whiteColor(),
      pageBody: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
              color: AppColors.primaryColor(),
              child: Row(
                children: [
                  AppTextBody1Widget()
                      .setText('Quản lý công thức')
                      .setTextStyle(TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor()))
                      .build(context),
                  const Spacer(),
                  AppIconButtonWidget(
                    icon: const Icon(Icons.add_circle_outline_rounded),
                    iconColor: AppColors.whiteColor(),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
