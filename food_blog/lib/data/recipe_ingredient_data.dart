import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';

class RecipeIngredientTagData {
  static final RecipeIngredientTagData _instance = RecipeIngredientTagData();
  static final _dbRef = FirebaseFirestore.instance
      .collection(RecipeIngredientTagCollection.collectionName);

  static RecipeIngredientTagData instance() {
    return _instance;
  }

  Future<void> addRecipeIngredientTag({String? tag, String? recipeId}) async {
    if (tag != null && recipeId != null) {
      await _dbRef.add({
        RecipeIngredientTagCollection.fieldTag: tag,
        RecipeIngredientTagCollection.fieldRecipeId: recipeId,
      });
    }
  }

  Future<void> removeRecipeIngredientTag(
      {String? tag, String? recipeId}) async {
    if (tag != null && recipeId != null) {
      await _dbRef
          .orderBy(RecipeIngredientTagCollection.fieldTag)
          .orderBy(RecipeIngredientTagCollection.fieldRecipeId)
          .get()
          .then(
            (value) async {
          for (var doc in value.docs) {
            if (doc.data()[RecipeIngredientTagCollection.fieldTag] == tag &&
                doc.data()[RecipeIngredientTagCollection.fieldRecipeId] ==
                    recipeId) {
              await _dbRef.doc(doc.id).delete();
              break;
            }
          }
        },
      );
    }
  }
}
