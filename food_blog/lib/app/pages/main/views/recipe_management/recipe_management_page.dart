import 'package:flutter/material.dart';
import 'package:food_blog/app/components/appBar/app_bar_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/addRecipe/add_recipe_controller.dart';
import 'package:food_blog/app/pages/main/views/recipe_management/recipe_management_controller.dart';
import 'package:get/get.dart';

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
      appbar: AppBarWidget(
        title: 'Quản lý công thức',
        actions: [
          IconButton(
            onPressed: () {Get.to(AddRecipePage());},
            icon: const Icon(Icons.add_circle_outline_rounded),
          )
        ],
      ).build(context),
      pageBody: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

        ],
      ),
    );
  }
}
