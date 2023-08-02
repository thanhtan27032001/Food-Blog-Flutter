part of 'base_model.dart';

@JsonSerializable()
class RecipeStepModel {
  late int stepIndex;
  late String description;
  late String? imgUrl;

  RecipeStepModel(this.stepIndex, this.description, {this.imgUrl});

  Map<String, dynamic> toJson() => _$RecipeStepModelToJson(this);

  factory RecipeStepModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepModelFromJson(json);
}
