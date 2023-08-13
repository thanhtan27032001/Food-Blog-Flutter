part of 'base_model.dart';

@JsonSerializable()
class RecipeStepModel {
  late int index;
  late String description;
  late String? imageUrl;

  @JsonKey(includeToJson: false)
  late String? imageLocalPath;

  RecipeStepModel({required this.index, required this.description, this.imageUrl});

  Map<String, dynamic> toJson() => _$RecipeStepModelToJson(this);

  factory RecipeStepModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepModelFromJson(json);
}
