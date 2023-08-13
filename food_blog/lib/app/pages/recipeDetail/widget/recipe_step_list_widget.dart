import 'package:flutter/cupertino.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/app/pages/watchVideo/watch_video_controller.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

class RecipeStepWidget extends StatelessWidget {
  final List<RecipeStepModel> recipeStepList;
  final String? videoUrl;

  const RecipeStepWidget(
      {super.key, required this.recipeStepList, this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppTextBody2Widget()
                .setText('Thực hiện')
                .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                .build(context),
            const Spacer(),
            if (videoUrl != null)
              GestureDetector(
                onTap: () {
                  Get.to(() => WatchVideoPage(), arguments: videoUrl);
                },
                child: AppTextBody2Widget()
                    .setText('Xem video hướng dẫn')
                    .setColor(AppColors.secondaryColor(level: 2))
                    .build(context),
              ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextBody2Widget()
                        .setText('Bước ${recipeStepList[index].index}')
                        .setTextStyle(
                            const TextStyle(fontWeight: FontWeight.bold))
                        .build(context),
                    const SizedBox(
                      height: 4,
                    ),
                    AppTextBody2Widget()
                        .setText(recipeStepList[index].description)
                        .setTextStyle(const TextStyle(height: 1.5))
                        .build(context),
                    const SizedBox(
                      height: 4,
                    ),
                    recipeStepList[index].imageUrl == null
                        ? const SizedBox()
                        : ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            child:
                                Image.network(recipeStepList[index].imageUrl!),
                          )
                  ],
                ),
              );
            },
            itemCount: recipeStepList.length,
            scrollDirection: Axis.vertical,
          ),
        )
      ],
    );
  }
}
