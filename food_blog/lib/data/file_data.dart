
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FileData {
  static final FileData _instance = FileData();
  static final storageRef = FirebaseStorage.instance.ref();

  static FileData instance() {
    return _instance;
  }

  Future<bool> uploadFile({String? filePath, String? fileKey}) async {
    bool result = false;
    if (filePath != null && fileKey != null) {
      try {
        await storageRef.child(fileKey).putFile(File(filePath));
        result = true;
      }
      catch (e) {
        e.printError();
        result = false;
      }
    }
    return result;
  }

  Future<String> getImageUrl(String imageKey) async {
    return await storageRef.child(imageKey).getDownloadURL();
  }
}