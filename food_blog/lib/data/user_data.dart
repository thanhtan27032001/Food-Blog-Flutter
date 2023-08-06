import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/domain/models/base_model.dart';

class UserData {
  static final UserData _instance = UserData();
  static final userDbRef = FirebaseFirestore.instance.collection(UserCollection.collectionName);

  static UserData instance() {
    return _instance;
  }

  Future<bool> checkEmailExisted(String email) async {
    bool result = true;
    await userDbRef.where(UserCollection.fieldEmail, isEqualTo: email).get().then(
      (value) {
        if (value.docs.isNotEmpty) {
          result = true;
        }
        else {
          result = false;
        }
      },
    );
    return result;
  }

  Future<void> addUser(UserModel user) async {
    bool isEmailExisted = await checkEmailExisted(user.email);
    if (isEmailExisted == false) {
      await userDbRef.add(user.toJson());
      print('Tạo user thành công');
    }
    else {
      print('Email tồn tại');
    }
  }

  Future<UserModel?> getUserById(String userId) async {
    // final data = userDbRef.
  }
}
