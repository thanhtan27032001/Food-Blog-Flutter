part of 'base_model.dart';

@JsonSerializable()
class RecipeModel {
  late String? title;
  late String? description;
  late int? cookTime;
  late int? prepareTime;
  late int? serveNum;
  late UserModel? author;
  late String? imageUrl;
  late String? videoUrl;
  late List<RecipeStepModel>? stepList;
  late List<RecipeIngredientModel>? ingredientList;

  RecipeModel({
    this.title,
    this.description,
    this.cookTime,
    this.prepareTime,
    this.serveNum,
    this.author,
    this.imageUrl,
    this.videoUrl,
    this.stepList,
    this.ingredientList,
  });

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}
