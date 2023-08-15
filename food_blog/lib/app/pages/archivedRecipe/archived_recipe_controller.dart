import 'package:flutter/material.dart';
import 'package:food_blog/app/components/appBar/app_bar_widget.dart';
import 'package:food_blog/app/components/button/app_icon_button_widget.dart';
import 'package:food_blog/app/components/loading/app_loading_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/main/views/recipeManagement/widget/my_recipe_preview_card_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/recipe_detail_controller.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/data/recipe_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

part 'archived_recipe_page.dart';

class ArchivedRecipeController extends GetxController {
  Rxn<List<RecipeModel>> myArchivedRecipeList = Rxn();

  @override
  void onInit() {
    super.onInit();
    getMyArchivedRecipeList();
  }

  Future<void> getMyArchivedRecipeList() async {
    myArchivedRecipeList.value =
        await RecipeData.instance().getMyArchivedRecipeList();
    myArchivedRecipeList.refresh();
  }

  void gotoRecipeDetail(int index) {
    Get.to(() => RecipeDetailPage(),
        arguments: myArchivedRecipeList.value?[index].recipeId);
  }

  Future<void> revertRecipe(int index) async {
    if (myArchivedRecipeList.value?[index].recipeId != null) {
      var result = await RecipeData.instance().updateRecipe(
          recipeId: myArchivedRecipeList.value![index].recipeId!,
          field: RecipeCollection.fieldStatus,
          value: RecipeStatus.draft.value);
      if (result == true) {
        const GetSnackBar(
          message: 'Khôi phục công thức thành công',
          duration: Duration(seconds: 2),
        ).show();
        getMyArchivedRecipeList();
      }
    }
  }
}
