part of 'base_model.dart';

@JsonSerializable()
class IngredientTagModel {
  String? tag;
  String? name;
  String? imageUrl;

  IngredientTagModel({
    this.tag,
    this.name,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() => _$IngredientTagModelToJson(this);

  factory IngredientTagModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientTagModelFromJson(json);
}
