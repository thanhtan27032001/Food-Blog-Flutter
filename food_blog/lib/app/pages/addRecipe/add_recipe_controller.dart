import 'package:flutter/material.dart';
import 'package:food_blog/app/components/dialog/app_dialog_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/components/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/data/recipe_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:food_blog/app/components/appBar/app_bar_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';

part 'add_recipe_page.dart';

class AddRecipeController extends GetxController {
  RxnString imageUrl = RxnString();
  late XFile? imageFile;
  final Rx<List<RecipeIngredientModel>> ingredientList = Rx([]);
  final Rx<List<RecipeStepModel>> stepList = Rx([]);
  ScrollController scrollController = ScrollController();

  RecipeModel newRecipe = RecipeModel();

  @override
  void onInit() {
    super.onInit();
    addIngredient();
    addStep();
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
    ingredientList.value.add(RecipeIngredientModel(''));
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

  void updateIngredient(int index, String ingredientDescription) {
    ingredientList.value[index].description = ingredientDescription;
  }

  void addStep() {
    stepList.value.add(RecipeStepModel(
        index: stepList.value.length + 1, description: '', imageUrl: null));
    stepList.refresh();
  }

  void removeStep(BuildContext context, int index) {
    stepList.value.removeAt(index);
    for (int i = 0; i < stepList.value.length; i++) {
      stepList.value[i].index = i + 1;
    }
    if (stepList.value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AppTextBody2Widget()
              .setText('Công thức phải có ít nhất 1 bước thực hiện')
              .build(context),
          behavior: SnackBarBehavior.floating,
        ),
      );
      addStep();
    } else {
      stepList.refresh();
    }
  }

  void updateStep(int index, String description) {
    stepList.value[index].description = description;
  }

  void pickStepImage(BuildContext context, int index) async {
    try {
      XFile? imageFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      String? imageUrl = imageFile?.path;
      if (imageUrl != null) {
        stepList.value[index].imageUrl = imageUrl;
        stepList.refresh();
        if (index == stepList.value.length - 1) {
          scrollController
              .jumpTo(scrollController.position.maxScrollExtent + 500);
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  void showDialogAddRecipe(BuildContext context) {
    AppDialogWidget(
      title: 'Tạo công thức thành công',
      content: 'Giờ đây mọi người đều có thể xem được công thức của bạn.',
      positiveText: 'Xác nhận',
      appDialogType: AppDialogType.success,
      onPositive: () {
        print('Tạo công thức');
        // executeAddRecipe();
      },
      negativeText: 'Hủy'
    ).buildDialog(context).show(context);
  }

  void executeAddRecipe() async {
    newRecipe.ingredientList = ingredientList.value;
    newRecipe.stepList = stepList.value;
    newRecipe.imageUrl = imageUrl.value;
    bool result = await RecipeData.instance().addRecipe(newRecipe);
    print('result ' + (result == true ? 'success' : 'fail'));
  }
}
