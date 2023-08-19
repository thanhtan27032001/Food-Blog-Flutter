import 'package:flutter/material.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/followButton/app_follow_button_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/components/textField/app_corner_card_text_field_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/followManagement/component/user_info_card_widget.dart';
import 'package:food_blog/app/pages/userWall/user_wall_controller.dart';
import 'package:food_blog/data/follow_data.dart';
import 'package:food_blog/data/user_data.dart';
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

  Future<void> getMyFollowingList() async {
    myFollowingList.value = await FollowData.instance().getFollowing(UserData.instance().userLogin?.id);
    myFollowingList.refresh();
  }

  Future<void> getMyFollowedList() async {
    myFollowedList.value = await FollowData.instance().getFollowed(UserData.instance().userLogin?.id);
    myFollowedList.refresh();
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

  Future<void> changeFollowStatusFollowingList(int index) async {
    bool currentStatus =  myFollowingList[index].isFollowed ?? false;
    if (currentStatus == true) { // unfollow
      final result = await FollowData.instance().unfollowUser(
          followedUserId: myFollowingList[index].id,
          followingUserId: UserData.instance().userLogin?.id);
      if (result == true) {
        myFollowingList[index].isFollowed = false;
        myFollowingList.refresh();
      }
    }
    else {
      final result = await FollowData.instance().followUser(
          followedUserId: myFollowingList[index].id,
          followingUserId: UserData.instance().userLogin?.id);
      if (result == true) { // follow
        myFollowingList[index].isFollowed = true;
        myFollowingList.refresh();
      }
    }
  }

  Future<void> changeFollowStatusFollowedList(int index) async {
    bool currentStatus =  myFollowedList[index].isFollowed ?? false;
    if (currentStatus == true) { // unfollow
      final result = await FollowData.instance().unfollowUser(
          followedUserId: myFollowedList[index].id,
          followingUserId: UserData.instance().userLogin?.id);
      if (result == true) {
        myFollowedList[index].isFollowed = false;
        myFollowedList.refresh();
      }
    }
    else { // follow
      final result = await FollowData.instance().followUser(
          followedUserId: myFollowedList[index].id,
          followingUserId: UserData.instance().userLogin?.id);
      if (result == true) {
        myFollowedList[index].isFollowed = true;
        myFollowedList.refresh();
      }
    }
  }
}