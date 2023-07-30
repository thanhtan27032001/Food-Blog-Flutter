import 'package:flutter/material.dart';
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
  final Rx<List<IngredientModel>> ingredientList = Rx([]);
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
    ingredientList.value.add(IngredientModel('', ''));
    ingredientList.refresh();
  }

  void removeIngredient(BuildContext context, int index) {
    ingredientList.value.removeAt(index);
    if (ingredientList.value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AppTextBody2Widget()
              .setText('Công thức phải có ít nhất 1 nguyên liệu')
              .build(context),
          behavior: SnackBarBehavior.floating,
        ),
      );
      addIngredient();
    } else {
      ingredientList.refresh();
    }
  }

  void updateIngredient(int index, String? name, String? numberDescription) {
    if (name != null) {
      ingredientList.value[index].name = name;
    }
    if (numberDescription != null) {
      ingredientList.value[index].numberDescription = numberDescription;
    }
  }
}
