import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/pages/addRecipe/add_recipe_controller.dart';
import 'package:food_blog/pages/main/main_controller.dart';

import 'firebase_options.dart';
import 'pages/login/login_controller.dart';

void main() async {
  runApp(AddRecipePage());
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //   if (user == null) {
  //     // User is signed out
  //     print('Sign out');
  //     runApp(const LoginPage());
  //   } else {
  //     // User is signed in
  //     print('Sign in');
  //     runApp(const MainPage());
  //   }
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FilledButton(
            // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),)),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            ),
            child: const Text('Go to login'),
          ),
        ),
      ),
    );
  }
}
