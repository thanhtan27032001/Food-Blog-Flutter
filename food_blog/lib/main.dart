import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/page/login/login_controller.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  Get.put(LoginController());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LoginPage());
}

