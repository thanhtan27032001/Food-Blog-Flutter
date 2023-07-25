import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:food_blog/components/appBar/app_bar_widget.dart';
import 'package:food_blog/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/configs/app_colors.dart';

part 'add_recipe_page.dart';

class AddRecipeController extends GetxController{
  RxnString imageUrl = RxnString();
  late XFile? imageFile;

  void pickImage(BuildContext context) async {
    try {
      imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      imageUrl.value = imageFile != null ? imageFile!.path : imageUrl.value;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }
}
