
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FileData {
  static final FileData _instance = FileData();
  static final storageRef = FirebaseStorage.instance.ref();

  static FileData instance() {
    return _instance;
  }

  Future<String?> uploadFile({String? filePath, String? fileKey}) async {
    if (filePath != null && fileKey != null) {
      try {
        await storageRef.child(fileKey).putFile(File(filePath));
        return storageRef.child(fileKey).getDownloadURL();
      }
      catch (e) {
        e.printError();
      }
    }
    return null;
  }

  Future<String> getImageUrl(String imageKey) async {
    return await storageRef.child(imageKey).getDownloadURL();
  }
}