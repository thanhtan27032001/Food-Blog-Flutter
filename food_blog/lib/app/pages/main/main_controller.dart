import 'package:flutter/material.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/main/views/account/account_controller.dart';
import 'package:food_blog/app/pages/main/views/favorite/favorite_recipe_controller.dart';
import 'package:food_blog/app/pages/main/views/home/home_controller.dart';
import 'package:food_blog/app/pages/main/views/recipeManagement/recipe_management_controller.dart';
import 'package:food_blog/app/pages/main/views/search/search_controller.dart';
import 'package:food_blog/data/user_data.dart';
import 'package:get/get.dart';

part 'main_page.dart';

class MainController extends GetxController{
  final RxInt _currentIndex = 0.obs;
  final List<Widget> _page = [
    HomePage(),
    SearchPage(),
    RecipeManagementPage(),
    FavoriteRecipePage(),
    AccountPage(),
  ];

  @override
  void onInit() {
    super.onInit();
    print(UserData.instance().getUserLogin()?.id);
    print(UserData.instance().getUserLogin()?.nickname);
  }
}
