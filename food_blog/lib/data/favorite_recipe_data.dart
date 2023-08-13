import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/data/recipe_data.dart';
import 'package:food_blog/data/user_data.dart';
import 'package:food_blog/domain/models/base_model.dart';

class FavoriteRecipeData {
  static final FavoriteRecipeData _instance = FavoriteRecipeData();
  static final _dbRef = FirebaseFirestore.instance
      .collection(FavoriteRecipeCollection.collectionName);

  static FavoriteRecipeData instance() {
    return _instance;
  }

  Future<String?> isMyFavoriteRecipe(String? recipeId) async {
    String? result;
    if (recipeId != null) {
      await _dbRef
          .orderBy(FavoriteRecipeCollection.fieldUserId)
          .orderBy(FavoriteRecipeCollection.fieldRecipeId)
          .where(FavoriteRecipeCollection.fieldUserId,
              isEqualTo: UserData.instance().userLogin.id)
          .where(FavoriteRecipeCollection.fieldRecipeId, isEqualTo: recipeId)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          result = value.docs[0].id;
        }
      });
    }
    return result;
  }

  Future<String?> changeFavoriteStatus(String? recipeId, {String? favoriteRecipeId}) async {
    if (recipeId != null) {
      if (favoriteRecipeId == null) {
        final result = await _dbRef.add({
          FavoriteRecipeCollection.fieldUserId:
              UserData.instance().getUserLogin()!.id,
          FavoriteRecipeCollection.fieldRecipeId: recipeId
        });
        return result.id;
      }
      else {
        await _dbRef.doc(favoriteRecipeId).delete();
      }
    }
    return null;
  }

  Future<int> countNumOfLike(String? recipeId) async {
    int result = 0;
    await _dbRef.orderBy(FavoriteRecipeCollection.fieldRecipeId).where(FavoriteRecipeCollection.fieldRecipeId, isEqualTo: recipeId).get().then((value) {
      result = value.docs.length;
    });
    return result;
  }

  Future<List<RecipeModel>> getMyFavoriteRecipeList() async {
    final List<RecipeModel> result = [];
    await _dbRef.orderBy(FavoriteRecipeCollection.fieldUserId).where(FavoriteRecipeCollection.fieldUserId, isEqualTo: UserData.instance().userLogin.id).get().then((value) async {
      for (var doc in value.docs) {
        final recipe = await RecipeData.instance().getRecipeById(doc.data()[FavoriteRecipeCollection.fieldRecipeId]);
        if (recipe != null) {
          result.add(recipe);
        }
      }
    });
    return result;
  }
}
