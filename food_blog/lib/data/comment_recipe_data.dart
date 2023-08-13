import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/data/user_data.dart';
import 'package:food_blog/domain/models/base_model.dart';

class CommentRecipeData {
  static final CommentRecipeData _instance = CommentRecipeData();
  static final _dbRef = FirebaseFirestore.instance
      .collection(CommentRecipeCollection.collectionName);

  static CommentRecipeData instance() {
    return _instance;
  }

  Future<List<RecipeCommentModel>> getRecipeCommentList(
      String? recipeId) async {
    final List<RecipeCommentModel> result = [];
    await _dbRef
        .orderBy(CommentRecipeCollection.fieldRecipeId)
        .orderBy(CommentRecipeCollection.fieldUpdateDate)
        .get()
        .then(
      (value) async {
        for (var doc in value.docs) {
          final comment = RecipeCommentModel.fromJson(doc.data());
          comment.user = await UserData.instance().getUserById(userId: doc.data()[CommentRecipeCollection.fieldUserId]);
          result.add(comment);
        }
      },
    );
    return result;
  }

  RecipeCommentModel? getMyRecipeComment(String? recipeId) {
    RecipeCommentModel? result;

    return result;
  }
}
