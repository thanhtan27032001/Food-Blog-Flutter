part of 'base_model.dart';

enum RecipeStatus {
  draft('draft'),
  public('public'),
  archive('archive');

  const RecipeStatus(this.value);

  final String value;
}

@JsonSerializable()
class RecipeModel {
  @JsonKey(includeToJson: false)
  late String? recipeId;
  late String? title; // require
  late String? description; // require
  late int? cookTime; // require
  late int? prepareTime; // require
  late int? serveNum; // require
  late UserModel? author;
  late String? imageUrl; // require
  late String? videoUrl;
  late List<RecipeStepModel>? stepList; // require
  late List<RecipeIngredientModel>? ingredientList; // require
  late String? status;
  late DateTime? updateDate;

  @JsonKey(includeToJson: false)
  late int? numOfLike;
  @JsonKey(includeToJson: false)
  late int? numOfComment;
  @JsonKey(includeToJson: false)
  late List<IngredientTagModel>? ingredientTagList;
  @JsonKey(includeToJson: false)
  late String? imageLocalPath;
  @JsonKey(includeToJson: false)
  late String? videoLocalPath;
  @JsonKey(includeToJson: false)
  late String? favoriteRecipeId;
  @JsonKey(includeToJson: false)
  late String? commentRecipeId;

  RecipeModel({
    this.recipeId,
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
    this.status,
    this.updateDate,
    this.numOfLike,
    this.numOfComment,
    this.favoriteRecipeId,
  });

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toAddRecipeParam() {
    final param = {
      ...toJson(),
      RecipeCollection.fieldUserId: UserData.instance().getUserLogin()!.id
    };
    param[RecipeCollection.fieldIngredientList] =
        ingredientList?.map((e) => e.toJson()).toList();
    param[RecipeCollection.fieldStepList] =
        stepList?.map((e) => e.toJson()).toList();
    param.remove(RecipeCollection.fieldAuthor);
    return param;
  }

  String getRecipeImageKey() {
    return '${UserData.instance().getUserLogin()!.id}/recipeImages/$recipeId';
  }

  String getStepImageKey(int index) {
    return '${UserData.instance().getUserLogin()!.id}/stepImages/$recipeId/$index';
  }

  String getRecipeVideoKey() {
    return '${UserData.instance().getUserLogin()!.id}/recipeVideos/$recipeId';
  }

  bool canBePublic() {
    return title != null &&
        description != null &&
        cookTime != null &&
        prepareTime != null &&
        serveNum != null &&
        imageUrl != null &&
        stepList != null &&
        ingredientList != null;
  }
}
