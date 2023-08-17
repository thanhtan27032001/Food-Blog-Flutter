import 'package:flutter/material.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/followButton/app_follow_button_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/components/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

part 'follow_management_page.dart';
part 'views/followed_view.dart';
part 'views/following_view.dart';
part 'views/search_user_view.dart';

class FollowManagementController extends GetxController {
  RxList<UserModel> myFollowingList = RxList();
  RxList<UserModel> myFollowedList = RxList();
  RxList<UserModel> searchedUserList = RxList();

  RxBool isSearching = false.obs;
  Rx<TextEditingController> searchController = Rx(TextEditingController());

  @override
  void onInit() {
    super.onInit();
    getMyFollowedList();
    getMyFollowingList();
  }

  void getMyFollowingList() {

  }

  void getMyFollowedList() {

  }

  void searchUser() {

  }

  void goBack(BuildContext context) {
    if (isSearching.value == true) {
      FocusScope.of(context).unfocus();
      searchController.value.clear();
      isSearching.value = false;
    }
    else {
      Get.back();
    }
  }
}