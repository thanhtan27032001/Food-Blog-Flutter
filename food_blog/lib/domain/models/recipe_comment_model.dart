part of 'base_model.dart';

@JsonSerializable()
class RecipeCommentModel {
  @JsonKey(includeFromJson: false)
  late String? id;
  late String? comment;
  late DateTime? updateDate;
  @JsonKey(includeFromJson: false)
  late UserModel? user;

  RecipeCommentModel({this.id, this.comment, this.updateDate, this.user});

  factory RecipeCommentModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeCommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeCommentModelToJson(this);

  Map<String, dynamic> toParam(String recipeId) {
    final param = toJson();
    param[CommentRecipeCollection.fieldUserId] = UserData.instance().userLogin?.id;
    param[CommentRecipeCollection.fieldRecipeId] = recipeId;
    return param;
  }
}