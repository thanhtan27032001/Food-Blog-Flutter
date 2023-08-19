import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';

class SeasonIngredientData {
  static final SeasonIngredientData _instance = SeasonIngredientData();
  static final _dbRef = FirebaseFirestore.instance.collection(SeasonIngredientCollection.collectionName);

  static SeasonIngredientData instance() {
    return _instance;
  }

  Future<List<String>> getTagBySeason(String? seasonId) async {
    List<String> result = [];
    await _dbRef
        .where(SeasonIngredientCollection.fieldSeasonId, isEqualTo: seasonId)
        .get()
        .then((value) {
      print('tag list size ${value.size}');
      for (var doc in value.docs) {
        result.add(doc[SeasonIngredientCollection.fieldIngredientTag]);
      }
    });
    return result;
  }
}