import 'package:flutter/material.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/main/views/home/home_controller.dart';
import 'package:food_blog/app/pages/main/views/recipe_management/recipe_management_controller.dart';
import 'package:get/get.dart';

part 'main_page.dart';

class MainController extends GetxController{
  final RxInt _currentIndex = 0.obs;
  final List<Widget> _page = [
    HomePage(),
    Container(
      color: Colors.black54,
    ),
    RecipeManagementPage(),
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
