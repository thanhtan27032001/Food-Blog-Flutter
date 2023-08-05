part of 'base_model.dart';

enum RecipeStatus {
  draft,
  public;
}

@JsonSerializable()
class RecipeModel {
  late String recipeId;
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
  // late List<IngredientTagModel>? ingredientTagList; //TODO: add ingredient tag
  late String status;

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

  Map<String, dynamic> toAddRecipeParam() {
    final param = {
      ...toJson(),
      RecipeCollection.fieldUserId: '2lyT6s0vzFDrDlwzFPil'
    };
    param[RecipeCollection.fieldIngredientList] =
        ingredientList?.map((e) => e.toJson()).toList();
    param[RecipeCollection.fieldStepList] =
        stepList?.map((e) => e.toJson()).toList();
    param.remove(RecipeCollection.fieldAuthor);
    return param;
  }

  String getRecipeImageKey() {
    //TODO: '<userId>/recipeImages/$recipeId'
    return '2lyT6s0vzFDrDlwzFPil/recipeImages/$recipeId';
  }

  String getStepImageKey(int index) {
    //TODO: '<userId>/stepImages/$recipeId/<stepIndex>'
    return '2lyT6s0vzFDrDlwzFPil/stepImages/$recipeId/$index';
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
