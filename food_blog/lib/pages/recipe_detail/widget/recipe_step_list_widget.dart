import 'package:flutter/cupertino.dart';
import 'package:food_blog/configs/app_colors.dart';
import 'package:food_blog/models/recipe_step.dart';

class RecipeStepWidget extends StatelessWidget {
  final List<RecipeStep> recipeStepList;

  const RecipeStepWidget({super.key, required this.recipeStepList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Thực hiện', style: TextStyle(fontWeight: FontWeight.bold),),
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
                    Text('Bước ${recipeStepList[index].stepIndex}', style: const TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 4,),
                    Text(recipeStepList[index].description, style: const TextStyle(height: 1.5),),
                    const SizedBox(height: 4,),
                    recipeStepList[index].imgUrl == null
                      ? const SizedBox()
                        : ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
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
