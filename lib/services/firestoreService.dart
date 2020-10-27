import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:my_app/model/cgpaModel.dart';

class FirestoreService {
  final CollectionReference _postsCollectionReference =
      FirebaseFirestore.instance.collection('cgpa');
  Future getPostsOnceOff() async {
    try {
      var postDocuments = await _postsCollectionReference.get();
      if (postDocuments.docs.isNotEmpty) {
        return postDocuments.docs
            .map((snapshot) => Cgpa.fromMap(snapshot.data(), snapshot.id))
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.toString();
      }
      return e.toString();
    }
  }
}
