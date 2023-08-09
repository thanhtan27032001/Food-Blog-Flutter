import 'package:flutter/material.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/components/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/main/views/home/widget/recipe_preview_card_lv2_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/recipe_detail_controller.dart';
import 'package:food_blog/data/recipe_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

part 'search_page.dart';

class SearchController extends GetxController {
  RxList<RecipeModel> searchResultList = RxList();
  Rx<TextEditingController> searchController = Rx(TextEditingController());
  final Debouncer debounce =
      Debouncer(delay: const Duration(milliseconds: 500));

  Future<void> searchRecipe() async {
    debounce(() async {
      print('keyword: "${searchController.value.value.text}"');
      searchResultList.clear();
      if (searchController.value.value.text != '') {
        searchResultList.addAll(await RecipeData.instance()
            .searchRecipeByTitle(searchController.value.value.text));
        searchResultList.refresh();
      } else {
        searchResultList.refresh();
      }
    });
  }
}
