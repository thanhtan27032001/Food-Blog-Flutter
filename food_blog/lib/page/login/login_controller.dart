import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_blog/component/app_main_page_widget.dart';
import 'package:food_blog/component/app_status_bar_widget.dart';
import 'package:food_blog/config/app_colors.dart';
import 'package:food_blog/config/text_style.dart';

part 'login_page.dart';
part 'widget/login_logo_widget.dart';
part 'widget/login_subtitle_widget.dart';

class LoginController {
  String username = "";
  String password = "";
}