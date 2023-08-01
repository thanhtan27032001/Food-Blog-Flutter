import 'package:flutter/material.dart';
import 'package:food_blog/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/configs/app_colors.dart';
import 'package:food_blog/pages/main/views/home/home_view.dart';
import 'package:food_blog/pages/main/views/recipe_management/recipe_management_page.dart';
import 'package:get/get.dart';

part 'main_page.dart';

class MainController extends GetxController{
  final RxInt _currentIndex = 0.obs;
  final List<Widget> _page = [
    const HomeView(),
    Container(
      color: Colors.black54,
    ),
    const RecipeManagementPage(),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.green,
    ),
  ];

  // final DatabaseReference _userRef = FirebaseDatabase.instanceFor(
  //   databaseURL: AppDataBaseConst.databaseUrl,
  //   app: Firebase.app(),
  // ).ref("users");
  //
  // void createUser() async {
  //   await _userRef.child('thanhtan27032001').set({"fullName": "Tân Nguyễn", "age": 22});
  //   print('Created user');
  // }
}
