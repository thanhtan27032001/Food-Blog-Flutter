import 'package:flutter/material.dart';
import 'package:food_blog/app/components/appBar/app_bar_widget.dart';
import 'package:food_blog/app/components/dialog/app_dialog_widget.dart';
import 'package:food_blog/app/components/loading/app_loading_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/addRecipe/add_recipe_controller.dart';
import 'package:food_blog/app/pages/main/views/recipeManagement/widget/my_recipe_preview_card_widget.dart';
import 'package:food_blog/app/pages/updateRecipe/update_recipe_controller.dart';
import 'package:food_blog/data/recipe_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

part 'favorite_recipe_page.dart';

class FavoriteRecipeController extends GetxController{
  Rxn<List<RecipeModel>> myRecipeList = Rxn();

  @override
  void onInit() {
    super.onInit();
    getMyRecipeList();
  }

  void getMyRecipeList() async {
    myRecipeList.value = await RecipeData.instance().getMyRecipeList();
  }

  Future<void> gotoAddRecipePage() async {
    final result = await Get.to(() => AddRecipePage());
    if (result == AddRecipeController.resultAddedRecipe) {
      Future.delayed(
        const Duration(milliseconds: 300),
        () {
          AppDialogWidget(
            title: 'Tạo công thức thành công!!!',
            content:
                'Giờ đây mọi người có thể học hỏi từ công thức mới của bạn.',
            appDialogType: AppDialogType.success,
            positiveText: 'Đồng ý',
            onPositive: () {
              print('Tạo công thức');
              // executeAddRecipe();
            },
          ).buildDialog(Get.context!).show(Get.context!);
        },
      );
    }
  }

  void editRecipe(int index) {
    Get.to(()=>UpdateRecipePage(), arguments: myRecipeList.value?[index].recipeId);
  }
}