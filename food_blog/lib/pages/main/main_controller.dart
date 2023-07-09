import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/configs/app_colors.dart';

part 'main_page.dart';


class MainController {
  final user = FirebaseAuth.instance.currentUser;
}