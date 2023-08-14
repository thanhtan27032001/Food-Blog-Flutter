import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/data/user_data.dart';
import 'package:food_blog/domain/models/base_model.dart';
import 'package:get/get.dart';

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
        .orderBy(CommentRecipeCollection.fieldUpdateDate, descending: true)
        .where(CommentRecipeCollection.fieldRecipeId, isEqualTo: recipeId)
        .get()
        .then(
      (value) async {
        for (var doc in value.docs) {
          final comment = RecipeCommentModel.fromJson(doc.data());
          comment.user = await UserData.instance().getUserById(
              userId: doc.data()[CommentRecipeCollection.fieldUserId]);
          result.add(comment);
        }
      },
    ).onError((error, stackTrace) {
      error.printError();
    });
    return result;
  }

  Future<RecipeCommentModel?> getMyRecipeComment(String? recipeId) async {
    RecipeCommentModel? result;
    await _dbRef
        .where(CommentRecipeCollection.fieldUserId,
            isEqualTo: UserData.instance().userLogin?.id)
        .where(CommentRecipeCollection.fieldRecipeId, isEqualTo: recipeId)
        .get()
        .then(
      (value) {
        if (value.docs.isNotEmpty) {
          result = RecipeCommentModel.fromJson(value.docs[0].data());
          result?.id = value.docs[0].id;
        }
      },
    );
    return result;
  }

  Future<String?> addComment(String recipeId, RecipeCommentModel comment) async {
    final result = await _dbRef.add(comment.toParam(recipeId));
    return result.id;
  }

  Future<void> deleteComment(RecipeCommentModel comment) async {
    await _dbRef.doc(comment.id).delete();
  }

  Future<void> updateComment(
      String recipeId, RecipeCommentModel comment) async {
    await _dbRef.doc(comment.id).set(comment.toParam(recipeId));
  }

  Future<int> countNumOfComment(String? recipeId) async {
    int result = 0;
    await _dbRef.orderBy(FavoriteRecipeCollection.fieldRecipeId).where(FavoriteRecipeCollection.fieldRecipeId, isEqualTo: recipeId).get().then((value) {
      result = value.docs.length;
    });
    return result;
  }
}
