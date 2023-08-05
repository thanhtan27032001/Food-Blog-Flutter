part of 'base_model.dart';

@JsonSerializable()
class RecipeModel {
  late String recipeId;
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
    return '2lyT6s0vzFDrDlwzFPil/stepImages/$recipeId/$index';
  }
}
