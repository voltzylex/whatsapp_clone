import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsapp_clone/utils/imports.dart';

class CommonFirebaseStorageRepositories {
  final FirebaseStorage firebaseStorage;
  CommonFirebaseStorageRepositories({required this.firebaseStorage});
  Future<String> storeFilesToFirebase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
