import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/configs/app_colors.dart';
import 'package:food_blog/configs/app_const.dart';
import 'package:food_blog/pages/main/views/home/home_view.dart';

part 'main_page.dart';

class MainController {
  final DatabaseReference _userRef = FirebaseDatabase.instanceFor(
    databaseURL: AppDataBaseConst.databaseUrl,
    app: Firebase.app(),
  ).ref("users");

  void createUser() async {
    await _userRef.child('thanhtan27032001').set({"fullName": "Tân Nguyễn", "age": 22});
    print('Created user');
  }
}
