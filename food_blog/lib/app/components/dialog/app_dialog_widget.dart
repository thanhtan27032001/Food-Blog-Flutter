import 'package:flutter/material.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:get/get.dart';

enum AppDialogType {
  success,
  error,
  confirm;
}

class AppDialogWidget {
  final String? title;
  final String? content;
  final String? positiveText;
  final String? negativeText;
  Widget? icon;
  final AppDialogType? appDialogType;
  final void Function()? onPositive;
  final void Function()? onNegative;
  final Widget? textField;
  final bool? isHaveCloseIcon;
  late final Dialog dialog;

  AppDialogWidget({
    required this.title,
    required this.content,
    this.positiveText,
    this.negativeText,
    this.icon,
    this.appDialogType,
    this.onPositive,
    this.onNegative,
    this.textField,
    this.isHaveCloseIcon,
  });

  AppDialogWidget buildDialog(BuildContext context) {
    if (appDialogType == AppDialogType.success) {
      icon = Image.asset(
        'assets/images/ic_success.png',
        width: 64,
        height: 64,
        fit: BoxFit.fill,
      );
    }
    if (appDialogType == AppDialogType.error) {
      icon = Image.asset(
        'assets/images/ic_fail.png',
        width: 64,
        height: 64,
        fit: BoxFit.fill,
      );
    }
    if (appDialogType == AppDialogType.confirm) {
      icon = Image.asset(
        'assets/images/ic_confirm.png',
        width: 64,
        height: 64,
        fit: BoxFit.fill,
      );
    }
    dialog = Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor(),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                if (icon != null) icon!,
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: AppTextBody1Widget()
                        .setText(title)
                        .setTextStyle(
                            const TextStyle(fontWeight: FontWeight.bold))
                        .setTextAlign(TextAlign.center)
                        .build(context),
                  ),
                if (content != null)
                  AppTextBody1Widget()
                      .setText(content)
                      .setTextAlign(TextAlign.center)
                      .build(context),
                const SizedBox(height: 24),
                if (textField != null) textField!,
                if (textField != null) const SizedBox(height: 24),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (negativeText != null)
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                AppColors.whiteColor(),
                              ),
                              overlayColor: MaterialStateProperty.all(
                                AppColors.grayColor(level: 1),
                              )),
                          onPressed: () {
                            Get.back();
                            onNegative?.call();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: AppTextBody1Widget()
                                .setText(negativeText ?? '')
                                .setColor(AppColors.blackColor())
                                .build(context),
                          ),
                        ),
                      ),
                    if (negativeText != null) const SizedBox(width: 12),
                    if (positiveText != null)
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              AppColors.secondaryColor(level: 2),
                            ),
                          ),
                          onPressed: () {
                            Get.back();
                            onPositive?.call();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: AppTextBody1Widget()
                                .setText(positiveText ?? '')
                                .setColor(AppColors.whiteColor())
                                .build(context),
                          ),
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
          isHaveCloseIcon == true
              ? Positioned(
                  right: 0.0,
                  child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              : const SizedBox()
        ],
      ),
    );
    return this;
  }

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return dialog;
      },
    );
  }
}
