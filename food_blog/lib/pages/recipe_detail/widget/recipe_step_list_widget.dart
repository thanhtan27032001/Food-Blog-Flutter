import 'package:flutter/cupertino.dart';
import 'package:food_blog/components/text/app_text_base_builder.dart';
import 'package:food_blog/models/recipe_step.dart';

class RecipeStepWidget extends StatelessWidget {
  final List<RecipeStep> recipeStepList;

  const RecipeStepWidget({super.key, required this.recipeStepList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody2Widget()
            .setText('Thực hiện')
            .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
            .build(context),
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
                        .setText('Bước ${recipeStepList[index].stepIndex}')
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
                    recipeStepList[index].imgUrl == null
                        ? const SizedBox()
                        : ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            child: Image.network(recipeStepList[index].imgUrl!),
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
