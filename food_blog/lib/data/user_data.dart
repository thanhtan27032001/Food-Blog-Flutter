import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:food_blog/domain/models/base_model.dart';

class UserData {
  static final UserData _instance = UserData();
  final userDbRef = FirebaseFirestore.instance.collection(UserCollection.collectionName);
  late UserModel userLogin;

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

  Future<UserModel?> getUserById({required String userId}) async {
    final data = await userDbRef.doc(userId).get();
    return data.data() != null ? UserModel.fromJson(data.data()!) : null;
  }

  Future<UserModel?> getUserByEmail({required String email}) async {
    final data = await userDbRef
        .where(UserCollection.fieldEmail, isEqualTo: email)
        .get();
    return data.docs.isNotEmpty
        ? UserModel.fromJson(
            {...data.docs[0].data(), UserCollection.fieldId: data.docs[0].id})
        : null;
  }

  void setUserLogin(UserModel userModel) {
    userLogin = userModel;
  }

  UserModel? getUserLogin() {
    return userLogin;
  }
}
