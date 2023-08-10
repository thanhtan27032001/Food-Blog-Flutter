import 'package:flutter/material.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/dialog/app_dialog_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/components/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/data/ingredient_data.dart';
import 'package:food_blog/data/recipe_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:food_blog/app/components/appBar/app_bar_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';

part 'add_recipe_page.dart';

part 'view/search_ingredient_tag_view.dart';

class AddRecipeController extends GetxController {
  static String resultAddedRecipe = 'resultAddedRecipe';

  RxnString imageUrl = RxnString();
  late XFile? imageFile;
  final Rx<List<RecipeIngredientModel>> ingredientList = Rx([]);
  final Rx<List<RecipeStepModel>> stepList = Rx([]);

  final Rx<List<IngredientTagModel>> ingredientTagList = Rx([]);
  final Rx<List<IngredientTagModel>> ingredientTagStoredList = Rx([]);
  final Rx<List<IngredientTagModel>> ingredientTagFilteredList = Rx([]);
  RxBool isSearchingIngredient = false.obs;
  Rx<TextEditingController> searchController = Rx(TextEditingController());

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

  String? validate() {
    if (imageUrl.value == null) {
      return 'Vui lòng chọn ảnh cho công thức.';
    }
    if (newRecipe.title == null || newRecipe.title!.trim() == '') {
      return 'Vui lòng nhập tên công thức.';
    }
    if (newRecipe.description == null || newRecipe.description!.trim() == '') {
      return 'Vui lòng nhập mô tả cho công thức.';
    }
    if (newRecipe.serveNum == null) {
      return 'Vui lòng nhập khẩu phần.';
    }
    if (newRecipe.prepareTime == null) {
      return 'Vui lòng nhập thời gian chuẩn bị.';
    }
    if (newRecipe.cookTime == null) {
      return 'Vui lòng nhập thơi gian thực hiện.';
    }
    return null;
  }

  void showDialogAddRecipe(BuildContext context) {
    String? error = validate();
    if (error == null) {
      AppDialogWidget(
              title: 'Xác nhận tạo công thức',
              content:
                  'Bạn có chắc chắn muốn tạo và công khai công thức mới của mình? Mọi người sẽ có thể xem được công thức mà bạn đăng.',
              appDialogType: AppDialogType.confirm,
              positiveText: 'Xác nhận',
              onPositive: () {
                print('Tạo công thức');
                executeAddRecipe(context);
              },
              negativeText: 'Hủy')
          .buildDialog(context)
          .show(context);
    } else {
      AppDialogWidget(
        title: 'Công thức chưa đủ thông tin',
        content: 'Bạn không thể công khai công thức ngay bây giờ. $error',
        appDialogType: AppDialogType.error,
        positiveText: 'Xác nhận',
        negativeText: 'Lưu nháp',
        onNegative: () {
          print('Lưu nháp');
          Get.back(result: resultAddedRecipe);
        },
      ).buildDialog(context).show(context);
    }
  }

  void executeAddRecipe(BuildContext context) async {
    newRecipe.ingredientList = ingredientList.value;
    newRecipe.stepList = stepList.value;
    newRecipe.imageUrl = imageUrl.value;
    newRecipe.ingredientTagList = ingredientTagList.value;
    newRecipe.updateDate = DateTime.now();
    newRecipe.numOfLike = 0;
    newRecipe.numOfComment = 0;
    bool result = await RecipeData.instance().addRecipe(newRecipe);
    if (result == true) {
      Get.back(result: resultAddedRecipe);
    }
  }

  void addIngredientTag(int index) {
    ingredientTagList.value.add(ingredientTagFilteredList.value[index]);
    ingredientTagList.refresh();
    cancelSearchIngredientTag();
  }

  void removeIngredientTag(int index) {
    ingredientTagList.value.removeAt(index);
    ingredientTagList.refresh();
  }

  void startSearchIngredientTag() async {
    isSearchingIngredient.value = true;
    if (ingredientTagStoredList.value.isEmpty) {
      ingredientTagStoredList.value.addAll(
          await IngredientData.instance().searchTagByKeyword(keyword: ''));
    }
  }

  void cancelSearchIngredientTag() {
    isSearchingIngredient.value = false;
    searchController.value.clear();
    ingredientTagFilteredList.value.clear();
    ingredientTagFilteredList.refresh();
  }

  void searchIngredientTag() {
    ingredientTagFilteredList.value.clear();
    final keyword = searchController.value.text.toLowerCase();
    ingredientTagFilteredList.value.addAll(ingredientTagStoredList.value.where(
        (element) =>
            (element.tag!.toLowerCase().contains(keyword) ||
                element.name!.toLowerCase().contains(keyword)) &&
            (ingredientTagList.value.contains(element) == false)));
    ingredientTagFilteredList.refresh();
  }
}
