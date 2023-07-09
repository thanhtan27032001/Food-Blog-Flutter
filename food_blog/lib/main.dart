import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/page/login/login_controller.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  // Get.put(LoginController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LoginPage(key: Key('login_page'),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: FilledButton(
            // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),)),
            onPressed: () => Get.to(const LoginPage()),
            child: const Text('Go to login'),
          ),
        ),
      ),
    );
  }
}
