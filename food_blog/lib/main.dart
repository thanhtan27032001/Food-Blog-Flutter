import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/app/pages/main/main_controller.dart';
import 'package:food_blog/app/pages/register/register_controller.dart';
import 'package:get/get.dart';

import 'app/pages/addRecipe/add_recipe_controller.dart';
import 'app/pages/login/login_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      runApp(const MyApp(initRoute: '/login'));
    } else {
      runApp(const MyApp(initRoute: '/main'));
    }
  });
}

class MyApp extends StatelessWidget {
  final String initRoute;

  const MyApp({super.key, required this.initRoute,});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: initRoute,
      getPages: [
        GetPage(
            name: '/login',
            page: () => LoginPage()),
        GetPage(
            name: '/register',
            page: () => RegisterPage()),
        GetPage(
            name: '/main',
            page: () => MainPage()),
        GetPage(
            name: '/addRecipe',
            page: () => AddRecipePage()),
      ],
    );
  }
}
