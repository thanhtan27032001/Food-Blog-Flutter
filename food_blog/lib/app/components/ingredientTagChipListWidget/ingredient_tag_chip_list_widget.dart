import 'package:flutter/material.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:get/get.dart';

class IngredientTagChipListWidget extends GetView{
  const IngredientTagChipListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: List.generate(
        controller.ingredientTagList.value.length,
            (index) {
          return Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.whiteColor(),
                borderRadius:
                const BorderRadius.all(Radius.circular(16)),
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  AppAvatarWidget(avtUrl: controller.ingredientTagList.value[index].imageUrl, size: 24)
                      .build(context),
                  const SizedBox(
                    width: 8,
                  ),
                  AppTextBody2Widget()
                      .setText(controller.ingredientTagList.value[index].name)
                      .build(context),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.removeIngredientTag(index);
                    },
                    child: const Icon(Icons.clear_rounded, size: 16,),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}