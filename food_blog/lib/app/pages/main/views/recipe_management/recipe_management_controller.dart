import 'package:flutter/material.dart';
import 'package:food_blog/app/components/appBar/app_bar_widget.dart';
import 'package:food_blog/app/components/dialog/app_dialog_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/addRecipe/add_recipe_controller.dart';
import 'package:get/get.dart';

part 'recipe_management_page.dart';

class RecipeManagementController extends GetxController{
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

}