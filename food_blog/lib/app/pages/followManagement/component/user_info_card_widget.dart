import 'package:flutter/material.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/followButton/app_follow_button_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:food_blog/utils/format_email_facade.dart';

class UserInfoCardWidget {
  final UserModel? userModel;
  final Function()? onCardPressed;
  final Function()? onFollowButtonPressed;

  UserInfoCardWidget(this.userModel,
      {this.onCardPressed, this.onFollowButtonPressed});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardPressed,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            AppAvatarWidget(
              avtUrl: userModel?.avatarUrl,
              size: 56,
            ).build(context),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextBody1Widget()
                      .setText(userModel?.nickname)
                      .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                      .build(context),
                  const SizedBox(height: 4),
                  AppTextBody2Widget()
                      .setText(FormatEmailFacade.getSortEmail(userModel?.email))
                      .setColor(AppColors.grayColor(level: 1))
                      .build(context),
                ],
              ),
            ),
            AppFollowButtonWidget(
              isFollowed: userModel?.isFollowed ?? false,
              onPressed: () {
                onFollowButtonPressed?.call();
              },
            ).build(context),
          ],
        ),
      ),
    );
  }
}
