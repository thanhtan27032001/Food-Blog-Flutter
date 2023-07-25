import 'package:flutter/material.dart';
import 'package:food_blog/components/appBar/app_bar_widget.dart';
import 'package:food_blog/components/mainPage/app_main_page_widget.dart';
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
      appbar: AppBarWidget(
        title: 'Quản lý công thức',
        actions: [
          IconButton(
            onPressed: () {},
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
