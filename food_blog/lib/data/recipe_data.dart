import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/data/file_data.dart';
import 'package:food_blog/domain/models/base_model.dart';

class RecipeData {
  static final RecipeData _instance = RecipeData();
  static final recipeDbRef =
      FirebaseFirestore.instance.collection(RecipeCollection.collectionName);

  static RecipeData instance() {
    return _instance;
  }

  Future<bool> addRecipe(RecipeModel recipe) async {
    bool result = false;
    // init param
    final param = {
      ...recipe.toJson(),
      RecipeCollection.fieldUserId: '2lyT6s0vzFDrDlwzFPil'
    };
    param[RecipeCollection.fieldIngredientList] =
        recipe.ingredientList?.map((e) => e.toJson()).toList();
    param[RecipeCollection.fieldStepList] =
        recipe.stepList?.map((e) => e.toJson()).toList();
    param.remove(RecipeCollection.fieldAuthor);
    // execute add
    String recipeId = '';
    await recipeDbRef.add(param).then((value) {
      result = true;
      recipeId = value.id;
    });
    // upload file
    if (result == true) {
      await FileData.instance().uploadFile(filePath: recipe.imageUrl, fileKey: '2lyT6s0vzFDrDlwzFPil/recipeImages/$recipeId');
    }
    return result;
  }

  Future<List<RecipeModel>?> getRecipeList() async {
    return null;
  }

  Future<RecipeModel?> getRecipeDetail() async {
    return null;
  }
}
