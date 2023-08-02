part of 'base_model.dart';

@JsonSerializable()
class RecipeIngredientModel {
  late String name;
  late String numberDescription;

  RecipeIngredientModel(this.name, this.numberDescription);

  Map<String, dynamic> toJson() => _$RecipeIngredientModelToJson(this);

  factory RecipeIngredientModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientModelFromJson(json);
}
