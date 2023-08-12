import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/data/file_data.dart';
import 'package:food_blog/data/recipe_ingredient_data.dart';
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
    // save tag
    for (var tag in recipe.ingredientTagList!) {
      RecipeIngredientTagData.instance()
          .addRecipeIngredientTag(tag: tag.tag, recipeId: recipe.recipeId);
    }
    // upload images
    if (result == true) {
      // recipe image
      String? uploadRecipeImgResult = await FileData.instance().uploadFile(
        filePath: recipe.imageUrl,
        fileKey: recipe.getRecipeImageKey(),
      );
      updateRecipe(
        recipeId: recipe.recipeId ?? '',
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
      updateRecipe(
          recipeId: recipe.recipeId ?? '',
          field: RecipeCollection.fieldStepList,
          value: recipe.stepList!.map((e) => e.toJson()).toList());
      // upload video
      String? uploadRecipeVideoResult = await FileData.instance().uploadFile(
        filePath: recipe.videoUrl,
        fileKey: recipe.getRecipeVideoKey(),
      );
      updateRecipe(
        recipeId: recipe.recipeId ?? '',
        field: RecipeCollection.fieldVideoUrl,
        value: uploadRecipeVideoResult,
      );
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

  Future<RecipeModel?> getRecipeById(String recipeId) async {
    late RecipeModel result;
    await recipeDbRef.doc(recipeId).get().then((value) async {
      if (value.data() != null) {
        result = RecipeModel.fromJson(value.data()!);
        result.recipeId = value.id;
        if (value.data()?[RecipeCollection.fieldUserId] != null) {
          result.author = await UserData.instance()
              .getUserById(userId: value.data()?[RecipeCollection.fieldUserId]);
        }
      }
    });
    return result;
  }

  Future<List<RecipeModel>> getNewestRecipeList() async {
    final List<RecipeModel> result = [];
    await recipeDbRef
        .orderBy(RecipeCollection.fieldUpdateDate, descending: true)
        .limit(20)
        .get()
        .then(
      (value) async {
        for (var doc in value.docs) {
          var recipe = RecipeModel.fromJson(doc.data());
          recipe.recipeId = doc.id;
          if (doc.data()[RecipeCollection.fieldUserId] != null) {
            recipe.author = await UserData.instance()
                .getUserById(userId: doc.data()[RecipeCollection.fieldUserId]);
            result.add(recipe);
          } else {
            result.add(recipe);
          }
        }
      },
    );
    return result;
  }

  Future<List<RecipeModel>> getPopularRecipeList() async {
    final List<RecipeModel> result = [];
    await recipeDbRef
        .orderBy(RecipeCollection.fieldNumOfLike, descending: true)
        .orderBy(RecipeCollection.fieldUpdateDate, descending: true)
        .limit(20)
        .get()
        .then(
      (value) async {
        for (var doc in value.docs) {
          var recipe = RecipeModel.fromJson(doc.data());
          recipe.recipeId = doc.id;
          if (doc.data()[RecipeCollection.fieldUserId] != null) {
            print(doc.data()[UserCollection.fieldId]);
            recipe.author = await UserData.instance()
                .getUserById(userId: doc.data()[RecipeCollection.fieldUserId]);
            result.add(recipe);
          } else {
            result.add(recipe);
          }
        }
      },
    );
    return result;
  }

  Future<List<RecipeModel>> getMyRecipeList() async {
    final List<RecipeModel> result = [];
    await recipeDbRef
        .orderBy(RecipeCollection.fieldUserId)
        .where(RecipeCollection.fieldUserId,
            isEqualTo: UserData.instance().getUserLogin()!.id)
        .get()
        .then(
      (value) async {
        for (var doc in value.docs) {
          var recipe = RecipeModel.fromJson(doc.data());
          recipe.recipeId = doc.id;
          result.add(recipe);
        }
      },
    );
    return result;
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

  Future<List<RecipeModel>> searchRecipeByTitle(String title) async {
    print('start search');
    final List<RecipeModel> result = [];
    await recipeDbRef
        .orderBy(RecipeCollection.fieldTitle)
        .get()
        .then((value) async {
      for (var doc in value.docs) {
        if (doc
            .data()[RecipeCollection.fieldTitle]
            .toString()
            .toLowerCase()
            .contains(title.toLowerCase())) {
          var recipe = RecipeModel.fromJson(doc.data());
          recipe.recipeId = doc.id;
          if (doc.data()[RecipeCollection.fieldUserId] != null) {
            print(doc.data()[UserCollection.fieldId]);
            recipe.author = await UserData.instance()
                .getUserById(userId: doc.data()[RecipeCollection.fieldUserId]);
            result.add(recipe);
          } else {
            result.add(recipe);
          }
        }
      }
    });
    return result;
  }

  Future<List<RecipeModel>> getRecipeByIngredientList(String tag) async {
    final List<RecipeModel> result = [];
    final recipeIdList =
        await RecipeIngredientTagData.instance().getRecipeIdListByTag(tag);
    for (var recipeId in recipeIdList) {
      final recipe = await getRecipeById(recipeId);
      if (recipe != null) {
        result.add(recipe);
      }
    }
    return result;
  }
}
