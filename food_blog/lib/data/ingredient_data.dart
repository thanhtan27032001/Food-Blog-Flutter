import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/domain/models/base_model.dart';

class IngredientData {
  static final IngredientData _instance = IngredientData();
  static final _ingredientDbRef = FirebaseFirestore.instance
      .collection(IngredientCollection.collectionName);

  static IngredientData instance() {
    return _instance;
  }

  Future<List<IngredientTagModel>> searchTagByKeyword({required String keyword}) async {
    List<IngredientTagModel> result = [];
    await _ingredientDbRef.get().then((value) {
      for (var doc in value.docs) {
        if (doc.id.toString().contains(keyword.toLowerCase()) ||
            doc
                .data()[IngredientCollection.fieldName]
                .toString()
                .toLowerCase()
                .contains(keyword.toLowerCase())) {
          result.add(IngredientTagModel.fromJson(doc.data()));
        }
      }
    });
    return result;
  }
}
