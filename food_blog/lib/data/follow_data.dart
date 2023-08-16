import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_blog/data/data_tree.dart';
import 'package:get/get.dart';

class FollowData {
  static final FollowData _instance = FollowData();
  static final _dbRef =
      FirebaseFirestore.instance.collection(FollowCollection.collectionName);

  static FollowData instance() {
    return _instance;
  }

  Future<int> countNumOfFollowing(String? userFollowingId) async {
    int result = 0;
    await _dbRef
        .where(FollowCollection.fieldUserFollowingId,
            isEqualTo: userFollowingId)
        .get()
        .then((value) {
      result = value.size;
    }).onError((error, stackTrace) {
      error.printError();
    });
    return result;
  }

  Future<int> countNumOfFollowed(String? userFollowedId) async {
    int result = 0;
    await _dbRef
        .where(FollowCollection.fieldUserFollowedId, isEqualTo: userFollowedId)
        .get()
        .then((value) {
      result = value.size;
    }).onError((error, stackTrace) {
      error.printError();
    });
    return result;
  }

  Future<bool> followUser(
      {String? followedUserId, String? followingUserId}) async {
    bool result = false;
    await _dbRef.add({
      FollowCollection.fieldUserFollowedId: followedUserId,
      FollowCollection.fieldUserFollowingId: followingUserId
    }).then((value) {
      result = true;
    }).onError((error, stackTrace) {
      result = false;
      error.printError();
    });
    return result;
  }

  Future<bool> unfollowUser(
      {String? followedUserId, String? followingUserId}) async {
    bool result = false;
    late final String? idFollow;
    if (followingUserId != null && followedUserId != null) {
      await _dbRef
          .where(
            FollowCollection.fieldUserFollowedId,
            isEqualTo: followedUserId,
          )
          .where(
            FollowCollection.fieldUserFollowingId,
            isEqualTo: followingUserId,
          )
          .get()
          .then(
        (value) {
          if (value.docs.isNotEmpty) {
            idFollow = value.docs[0].id;
          }
        },
      );
    }
    if (idFollow != null) {
      await _dbRef.doc(idFollow).delete().then((value) {
        result = true;
      });
    }
    return result;
  }

  Future<bool> isFollowed(
      {String? followedUserId, String? followingUserId}) async {
    bool result = false;
    if (followingUserId != null && followedUserId != null) {
      await _dbRef
          .where(
            FollowCollection.fieldUserFollowedId,
            isEqualTo: followedUserId,
          )
          .where(FollowCollection.fieldUserFollowingId,
              isEqualTo: followingUserId)
          .get()
          .then(
        (value) {
          if (value.size > 0) {
            result = true;
          }
        },
      ).onError(
        (error, stackTrace) {
          result = false;
          error.printError();
        },
      );
    }
    return result;
  }
}
