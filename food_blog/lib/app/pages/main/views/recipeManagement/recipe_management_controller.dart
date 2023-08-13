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
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/data/recipe_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

part 'recipe_management_page.dart';

class RecipeManagementController extends GetxController {
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
          ).buildDialog(Get.context!).show(Get.context!);
        },
      );
    }
  }

  Future<void> editRecipe(int index) async {
    final result = await Get.to(() => UpdateRecipePage(),
        arguments: myRecipeList.value?[index].recipeId);
    if (result == UpdateRecipeController.resultAddedRecipe) {
      Future.delayed(
        const Duration(milliseconds: 300),
        () {
          AppDialogWidget(
            title: 'Cập nhật công thức thành công!!!',
            content:
                'Giờ đây mọi người có thể thấy những thay đổi mới từ công thức mới của bạn.',
            appDialogType: AppDialogType.success,
            positiveText: 'Đồng ý',
          ).buildDialog(Get.context!).show(Get.context!);
        },
      );
    }
  }

  Future<void> archiveRecipe(int index) async {
    final result = await RecipeData.instance().updateRecipe(
        recipeId: myRecipeList.value![index].recipeId!,
        field: RecipeCollection.fieldStatus,
        value: RecipeStatus.archive.value);
    if (result == true) {
      myRecipeList.value?.removeAt(index);
      myRecipeList.refresh();
      const GetSnackBar(
        message:
        'Lưu trữ thành công, công thức đã được chuyên đến danh sách lưu trữ của bạn',
        duration: Duration(seconds: 2),
      ).show();
    }
  }

  Future<void> changeRecipeStatus(int index) async {
    // public to draft
    if (myRecipeList.value![index].status == RecipeStatus.public.value) {
      final result = await RecipeData.instance().updateRecipe(
          recipeId: myRecipeList.value![index].recipeId!,
          field: RecipeCollection.fieldStatus,
          value: RecipeStatus.draft.value);
      if (result == true) {
        myRecipeList.value![index].status = RecipeStatus.draft.value;
        myRecipeList.refresh();
        const GetSnackBar(
          message:
              'Lưu nháp công thức thành công, giờ đây chỉ có bạn có thể xem công thức này :v',
          duration: Duration(seconds: 2),
        ).show();
      }
    }
    // draft to public
    else {
      if (myRecipeList.value?[index].canBePublic() == true) {
        final result = await RecipeData.instance().updateRecipe(
            recipeId: myRecipeList.value![index].recipeId!,
            field: RecipeCollection.fieldStatus,
            value: RecipeStatus.public.value);
        if (result == true) {
          myRecipeList.value![index].status = RecipeStatus.public.value;
          myRecipeList.refresh();
          const GetSnackBar(
            message:
                'Công khai công thức thành công, giờ đây mọi người đều có thể tham khảo công thức của bạn :)',
            duration: Duration(seconds: 2),
          ).show();
        }
      } else {
        const GetSnackBar(
          message:
              'Công thức chưa đủ thông tin để công khai, bạn vui lòng bổ sung thêm nha :(',
          duration: Duration(seconds: 2),
        ).show();
      }
    }
  }
}
