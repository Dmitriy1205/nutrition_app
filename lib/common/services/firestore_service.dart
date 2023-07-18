import 'package:cloud_firestore/cloud_firestore.dart';

import '../exceptions.dart';

class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Future<void> write({
    required String collection,
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collection).doc(userId).set(data,SetOptions(merge: true));
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> read({
    required String collectionName,
    required String docId,
  }) async {
    try {
      final data = await _firestore.collection(collectionName).doc(docId).get();
      return data;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> update(
      {required String collectionName,
      required String userId,
      required Map<String, dynamic> data}) async {
    try {
      _firestore.collection(collectionName).doc(userId).update(data);
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
