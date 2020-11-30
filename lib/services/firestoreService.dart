import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _postsCollectionReference =
      FirebaseFirestore.instance.collection('cgpa');

  Future<DocumentSnapshot> getDocumentById(String id) {
    return _postsCollectionReference.doc(id).get();
  }
}
