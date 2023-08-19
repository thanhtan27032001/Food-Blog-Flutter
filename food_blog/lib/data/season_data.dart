import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:get/get.dart';

class SeasonData {
  static final SeasonData _instance = SeasonData();
  static final _dbRef =
      FirebaseFirestore.instance.collection(SeasonCollection.collectionName);

  static SeasonData instance() {
    return _instance;
  }

  Future<String?> getSeasonIdByMonth(int month) async {
    String? result;
    await _dbRef
        .where(SeasonCollection.fieldMonth, arrayContains: month)
        .get()
        .then(
      (value) {
        if (value.size > 0) {
          result = value.docs[0].id;
        }
      },
    ).onError(
      (error, stackTrace) {
        error.printError();
      },
    );
    return result;
  }
}
