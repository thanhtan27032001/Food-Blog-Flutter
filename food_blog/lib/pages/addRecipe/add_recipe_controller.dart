import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_blog/components/button/app_filled_corner_button_widget.dart';
import 'package:food_blog/components/text/app_text_base_builder.dart';
import 'package:food_blog/components/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/models/ingredient_model.dart';
import 'package:food_blog/models/step_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:food_blog/components/appBar/app_bar_widget.dart';
import 'package:food_blog/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/configs/app_colors.dart';

part 'add_recipe_page.dart';

class AddRecipeController extends GetxController {
  RxnString imageUrl = RxnString();
  late XFile? imageFile;
  RxInt ingredientCount = 0.obs;
  RxInt stepCount = 0.obs;
  final List<IngredientModel> ingredientList = [];
  final List<StepModel> stepList = [];

  @override
  void onInit() {
    super.onInit();
    addIngredient();
  }

  void pickRecipeImage(BuildContext context) async {

    try {
      imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      imageUrl.value = imageFile != null ? imageFile!.path : imageUrl.value;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  void addIngredient() {
    ingredientList.add(IngredientModel(UniqueKey().hashCode.toString(), '', ''));
    ingredientCount.value = ingredientList.length;
  }

  void removeIngredient(String id) {
    print('must remove $id');
    ingredientList.removeWhere((element) => element.id == id);
    ingredientCount.value = ingredientList.length;
  }

  void updateIngredient(int index, String? name, String? numberDescription) {
    if (name != null) {
      ingredientList[index].name = name;
    }
    if (numberDescription != null) {
      ingredientList[index].numberDescription = numberDescription;
    }
  }
}
