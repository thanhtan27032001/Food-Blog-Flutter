part of 'base_model.dart';

@JsonSerializable()
class RecipeModel {
  late String title;
  late String? description;
  late UserModel author;
  late String imageUrl;
  late String? videoUrl;
  late List<RecipeStepModel>? recipeStepList;
  late List<RecipeIngredientModel>? recipeIngredientList;

  RecipeModel({
    required this.title,
    this.description,
    required this.author,
    required this.imageUrl,
    this.videoUrl,
    this.recipeStepList,
    this.recipeIngredientList,
  });

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}
