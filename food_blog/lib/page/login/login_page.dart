import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_blog/config/app_colors.dart';
import 'package:food_blog/config/text_style.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
    );
    return MaterialApp(
      home: Scaffold(
        body: _loginBody(context),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _loginBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
              width: double.infinity,
              color: Colors.white,
            ),
            const LoginLogo(),
            const LoginSubtitle(),
          ],
        ),
      ),
    );
  }
}

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Food',
            style: TextStyle(
              fontSize: AppTextStyle.fontSizeDisplay2,
              fontWeight: FontWeight.bold,
              color: AppColors.getPrimaryColor(),
            ),
          ),
          Text(
            'blog',
            style: TextStyle(
              fontSize: AppTextStyle.fontSizeDisplay2,
              fontWeight: FontWeight.bold,
              color: AppColors.getBlackColor(),
            ),
          ),
          SizedBox(
            width: 45,
            height: 45,
            child: Image.asset('assets/images/login_logo.png'),
          )
        ],
      ),
    );
  }
}

class LoginSubtitle extends StatelessWidget {
  const LoginSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Text(
        'Khám phá nhiều hơn công thức mới\ndành riêng cho bạn',
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.getGrayColor(level: 2)),
      ),
    );
  }
}
