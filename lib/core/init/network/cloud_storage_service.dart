import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'cloud_storage_result.dart';

class CloudStorageService {
  Future<CloudStorageResult> uploadImage({
    File imageToUpload,
  }) async {
    var imageFileName = DateTime.now()
        .millisecondsSinceEpoch
        .toString(); // burada object id olsun ya da datetime + objectid olsun

    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);

    StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageToUpload);

    StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;

    var downloadUrl = await storageSnapshot.ref.getDownloadURL();

    if (uploadTask.isComplete) {
      var url = downloadUrl.toString();
      return CloudStorageResult(
        imageUrl: url,
        imageFileName: imageFileName,
      );
    }
    return null;
  }
}
