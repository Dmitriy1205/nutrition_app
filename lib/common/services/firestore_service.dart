import 'package:cloud_firestore/cloud_firestore.dart';

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
      await _firestore
          .collection(collection)
          .doc(userId)
          .set(data, SetOptions(merge: true));
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> writeSubCollection({
    required String collection,
    required String userId,
    required String subCollection,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(collection)
          .doc(userId)
          .collection(subCollection)
          .doc('0')
          .set(data);
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

  Future<DocumentSnapshot<Map<String, dynamic>>> readSubCollection({
    required String collectionName,
    required String docId,
    required String subCollection,
  }) async {
    try {
      final data = await _firestore
          .collection(collectionName)
          .doc(docId)
          .collection(subCollection)
          .doc('0')
          .get();
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
      await _firestore.collection(collectionName).doc(userId).update(data);
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateFieldSubCollection({
    required String collection,
    required String userId,
    required String subCollection,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(collection)
          .doc(userId)
          .collection(subCollection)
          .doc('0')
          .update(data);
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
