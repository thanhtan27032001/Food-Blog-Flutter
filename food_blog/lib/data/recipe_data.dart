import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/domain/models/base_model.dart';

class RecipeData {
  static final RecipeData _instance = RecipeData();
  static final recipeDbRef = FirebaseFirestore.instance.collection(RecipeCollection.collectionName);

  static RecipeData instance() {
    return _instance;
  }

  Future<void> addRecipe(RecipeModel recipe) async {

  }

  Future<List<RecipeModel>?> getRecipeList() async {
    return null;
  }

  Future<RecipeModel?> getRecipeDetail() async {
    return null;
  }
}