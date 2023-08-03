part of 'base_model.dart';

@JsonSerializable()
class RecipeIngredientModel {
  late String description;

  RecipeIngredientModel(this.description);

  Map<String, dynamic> toJson() => _$RecipeIngredientModelToJson(this);

  factory RecipeIngredientModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientModelFromJson(json);
}
