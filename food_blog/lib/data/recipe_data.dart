import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/data/file_data.dart';
import 'package:food_blog/data/user_data.dart';
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
    final param = recipe.toAddRecipeParam();
    // add basic info
    await recipeDbRef.add(param).then((value) {
      result = true;
      recipe.recipeId = value.id;
    });
    // upload images
    if (result == true) {
      // recipe image
      String? uploadRecipeImgResult = await FileData.instance().uploadFile(
        filePath: recipe.imageUrl,
        fileKey: recipe.getRecipeImageKey(),
      );
      // recipeDbRef.doc(recipe.recipeId).update({
      //   RecipeCollection.fieldImageUrl:
      //       uploadRecipeImgResult == true ? recipe.getRecipeImageKey() : null
      // });
      updateRecipe(
        recipeId: recipe.recipeId,
        field: RecipeCollection.fieldImageUrl,
        value: uploadRecipeImgResult,
      );
      // step images
      for (int index = 0; index < recipe.stepList!.length; index++) {
        if (recipe.stepList![index].imageUrl != null) {
          String? uploadStepImgResult = await FileData.instance().uploadFile(
            filePath: recipe.stepList![index].imageUrl,
            fileKey: recipe.getStepImageKey(index),
          );
          recipe.stepList![index].imageUrl = uploadStepImgResult;
        }
      }
      // recipeDbRef.doc(recipe.recipeId).update({
      //   RecipeCollection.fieldStepList: recipe.stepList!.map((e) => e.toJson()).toList()
      // });
      updateRecipe(
          recipeId: recipe.recipeId,
          field: RecipeCollection.fieldStepList,
          value: recipe.stepList!.map((e) => e.toJson()).toList());
    }
    return result;
  }

  Future<bool> updateRecipe(
      {required String recipeId, String? field, dynamic value}) async {
    bool result = false;
    if (field != null) {
      // update 1 field
      await recipeDbRef
          .doc(recipeId)
          .update({field: value}).then((value) => result = true);
    } else {
      // update all
      await recipeDbRef.doc(recipeId).set(value).then((value) => result = true);
    }
    return result;
  }

  Future<List<RecipeModel>?> getRecipeList() async {
    return null;
  }

  Future<RecipeModel?> getRecipeDetail({required String recipeId}) async {
    var recipe = RecipeModel();
    await recipeDbRef.doc(recipeId).get().then((value) async {
      final data = value.data() as Map<String, dynamic>;
      print(data);
      recipe = RecipeModel.fromJson(data);
      recipe.author = await UserData.instance()
          .getUserById(userId: data[RecipeCollection.fieldUserId]);
    });
    return recipe;
  }
}
