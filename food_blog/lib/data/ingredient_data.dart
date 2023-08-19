import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/data/season_data.dart';
import 'package:food_blog/data/season_ingredient_data.dart';
import 'package:food_blog/domain/models/base_model.dart';

class IngredientData {
  static final IngredientData _instance = IngredientData();
  static final _dbRef = FirebaseFirestore.instance
      .collection(IngredientCollection.collectionName);

  static IngredientData instance() {
    return _instance;
  }

  Future<List<IngredientTagModel>> searchTagByKeyword({required String keyword}) async {
    List<IngredientTagModel> result = [];
    await _dbRef.get().then((value) {
      for (var doc in value.docs) {
        print(doc.id);
        if (doc.id.toString().contains(keyword.toLowerCase()) ||
            doc
                .data()[IngredientCollection.fieldName]
                .toString()
                .toLowerCase()
                .contains(keyword.toLowerCase())) {
          final tag = IngredientTagModel.fromJson(doc.data());
          tag.tag = doc.id;
          result.add(tag);
        }
      }
    });
    return result;
  }

  Future<List<IngredientTagModel>> getTagThisSeason() async {
    List<IngredientTagModel> result = [];
    final currentMonth = DateTime.now().month;
    String? currentSeasonId = await SeasonData.instance().getSeasonIdByMonth(currentMonth);
    List<String> ingredientTagCurrentSeasonList = await SeasonIngredientData.instance().getTagBySeason(currentSeasonId);
    for (var tag in ingredientTagCurrentSeasonList) {
      await _dbRef.doc(tag).get().then((value) {
        if (value.data() != null) {
          final cTag = IngredientTagModel.fromJson(value.data()!);
          cTag.tag = tag;
          result.add(cTag);
        }
      });
    }
    return result;
  }
}
