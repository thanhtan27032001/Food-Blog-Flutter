import 'package:flutter/material.dart';
import 'package:food_blog/configs/app_colors.dart';

class RecipeIngredientListWidget extends StatelessWidget {
  final List<String> ingredientList;

  const RecipeIngredientListWidget({super.key, required this.ingredientList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Nguyên liệu', style: TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 16,),
        SizedBox(
          width: double.infinity,
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: index % 2 == 0 ? AppColors.grayColor(level: 0) : AppColors.whiteColor(),
                    borderRadius: const BorderRadius.all(Radius.circular(8))
                ),
                child: Text(ingredientList[index]),
              );
            },
            itemCount: ingredientList.length,
            scrollDirection: Axis.vertical,
          ),
        )
      ],
    );
  }
}