import 'package:flutter/material.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/dialog/app_dialog_widget.dart';
import 'package:food_blog/app/components/loading/app_loading_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/components/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/app/components/videoPlayer/app_video_player_widget.dart';
import 'package:food_blog/data/ingredient_data.dart';
import 'package:food_blog/data/recipe_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:food_blog/app/components/appBar/app_bar_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:video_player/video_player.dart';

part 'update_recipe_page.dart';

part 'view/search_ingredient_tag_view.dart';

class UpdateRecipeController extends GetxController {
  static String resultAddedRecipe = 'resultAddedRecipe';

  // RxnString imageUrl = RxnString();
  // String? videoUrl;
  late XFile? imageFile;
  late XFile? videoFile;
  late VideoPlayerController videoPlayerController;
  RxBool isVideoInitialized = false.obs;

  // final Rx<List<RecipeIngredientModel>> ingredientList = Rx([]);
  // final Rx<List<RecipeStepModel>> stepList = Rx([]);

  final Rx<List<IngredientTagModel>> ingredientTagList = Rx([]);
  final Rx<List<IngredientTagModel>> ingredientTagStoredList = Rx([]);
  final Rx<List<IngredientTagModel>> ingredientTagFilteredList = Rx([]);
  RxBool isSearchingIngredient = false.obs;
  Rx<TextEditingController> searchController = Rx(TextEditingController());

  ScrollController scrollController = ScrollController();

  Rxn<RecipeModel> newRecipe = Rxn();

  // RecipeModel newRecipe = RecipeModel();

  @override
  void onInit() {
    super.onInit();
    final recipeId = Get.arguments;
    getRecipeDetail(recipeId);
    addIngredient();
    addStep();
  }

  Future<void> getRecipeDetail(String? recipeId) async {
    if (recipeId != null) {
      newRecipe.value =
          await RecipeData.instance().getMyRecipeDetail(recipeId: recipeId);
      if (newRecipe.value?.videoUrl != null) {
        initVideoController(url: newRecipe.value?.videoUrl);
      }
    }
  }

  void pickRecipeImage(BuildContext context) async {
    AppDialogWidget(
      title: 'Chọn ảnh cho công thức',
      content: 'Baạn muốn chọn ảnh bằng phương thức nào?',
      appDialogType: AppDialogType.confirm,
      positiveText: 'Chọn từ thư viện',
      negativeText: 'Chụp ảnh mới',
      onPositive: () async {
        try {
          imageFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          newRecipe.value?.imageLocalPath = (imageFile != null)
              ? imageFile!.path
              : newRecipe.value?.imageLocalPath;
          newRecipe.refresh();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
            ),
          );
        }
      },
      onNegative: () async {
        try {
          imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
          newRecipe.value?.imageLocalPath = imageFile != null
              ? imageFile!.path
              : newRecipe.value?.imageLocalPath;
          newRecipe.refresh();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
            ),
          );
        }
      },
    ).buildDialog(context).show(context);
  }

  void pickRecipeVideo(BuildContext context) async {
    try {
      videoFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (videoFile != null) {
        newRecipe.value?.videoLocalPath = videoFile!.path;
        initVideoController(file: File(newRecipe.value!.videoLocalPath!));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  Future<void> initVideoController({File? file, String? url}) async {
    if (file != null || url != null) {
      if (file != null) {
        videoPlayerController = VideoPlayerController.file(file);
      } else {
        videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(url!));
      }
      await videoPlayerController.initialize().then((value) {
        videoPlayerController.play();
        isVideoInitialized.value = true;
      });
    }
  }

  void removeRecipeVideo(BuildContext context) {
    newRecipe.value?.videoLocalPath = null;
    newRecipe.value?.videoUrl = null;
    videoPlayerController.dispose();
    isVideoInitialized.value = false;
  }

  void addIngredient() {
    newRecipe.value?.ingredientList?.add(RecipeIngredientModel(''));
    newRecipe.refresh();
  }

  void removeIngredient(BuildContext context, int index) {
    newRecipe.value?.ingredientList?.removeAt(index);
    if (newRecipe.value!.ingredientList!.isEmpty) {
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
      newRecipe.refresh();
    }
  }

  void updateIngredient(int index, String ingredientDescription) {
    newRecipe.value?.ingredientList?[index].description = ingredientDescription;
  }

  void addStep() {
    newRecipe.value?.stepList?.add(RecipeStepModel(
        index: newRecipe.value!.stepList!.length + 1,
        description: '',
        imageUrl: null,
        imageLocalPath: null));
    newRecipe.refresh();
  }

  void removeStep(BuildContext context, int index) {
    newRecipe.value?.stepList?.removeAt(index);
    for (int i = 0; i < newRecipe.value!.stepList!.length; i++) {
      newRecipe.value?.stepList?[i].index = i + 1;
    }
    if (newRecipe.value!.stepList!.isEmpty) {
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
      newRecipe.refresh();
    }
  }

  void updateStep(int index, String description) {
    newRecipe.value?.stepList?[index].description = description;
  }

  void pickStepImage(BuildContext context, int index) async {
    try {
      XFile? imageFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      String? imageUrl = imageFile?.path;
      if (imageUrl != null) {
        newRecipe.value?.stepList?[index].imageLocalPath = imageUrl;
        newRecipe.refresh();
        if (index == newRecipe.value!.stepList!.length - 1) {
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
    // if (imageUrl.value == null) {
    //   return 'Vui lòng chọn ảnh cho công thức.';
    // }
    if (newRecipe.value?.title == null ||
        newRecipe.value?.title!.trim() == '') {
      return 'Vui lòng nhập tên công thức.';
    }
    if (newRecipe.value?.description == null ||
        newRecipe.value?.description!.trim() == '') {
      return 'Vui lòng nhập mô tả cho công thức.';
    }
    if (newRecipe.value?.serveNum == null) {
      return 'Vui lòng nhập khẩu phần.';
    }
    if (newRecipe.value?.prepareTime == null) {
      return 'Vui lòng nhập thời gian chuẩn bị.';
    }
    if (newRecipe.value?.cookTime == null) {
      return 'Vui lòng nhập thơi gian thực hiện.';
    }
    return null;
  }

  void showDialogAddRecipe(BuildContext context) {
    String? error = validate();
    if (error == null) {
      AppDialogWidget(
              title: 'Xác nhận cập nhật công thức',
              content:
                  'Bạn có chắc chắn muốn cập nhật và công khai công thức mới của mình? Mọi người sẽ có thể xem được công thức mà bạn đăng.',
              appDialogType: AppDialogType.confirm,
              positiveText: 'Xác nhận',
              onPositive: () {
                print('Cập nhật công thức');
                executeUpdateRecipe(context);
              },
              negativeText: 'Hủy')
          .buildDialog(context)
          .show(context);
    } else {
      AppDialogWidget(
        title: 'Công thức chưa đủ thông tin',
        content:
            'Bạn không thể cập nhật công khai công thức ngay bây giờ. $error',
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

  void executeUpdateRecipe(BuildContext context) async {
    newRecipe.value?.updateDate = DateTime.now();
    bool result = await RecipeData.instance().replaceRecipe(newRecipe.value!);
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
