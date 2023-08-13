part of 'base_model.dart';

@JsonSerializable()
class RecipeCommentModel {
  @JsonKey(includeFromJson: false)
  late String? id;
  late String? comment;
  late DateTime? commentDate;
  @JsonKey(includeFromJson: false)
  late UserModel? user;

  RecipeCommentModel({this.id, this.comment, this.commentDate, this.user});

  factory RecipeCommentModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeCommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeCommentModelToJson(this);
}