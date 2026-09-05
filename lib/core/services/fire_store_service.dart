import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(
    String collectionName,
    String docId,
  ) async {
    return await firestore.collection(collectionName).doc(docId).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getDocWhere(
    String collectionName,
    String field,
    String value,
  ) async {
    return await firestore
        .collection(collectionName)
        .where(field, isEqualTo: value)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCollectionBetweenDates(
    String collectionName,
    String field,
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await firestore
        .collection(collectionName)
        .where(field, isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
        .where(field, isLessThan: Timestamp.fromDate(endDate))
        .get();
  }

  Future<void> setDoc(
    String collectionName,
    String docId,
    Map<String, dynamic> data,
  ) async {
    await firestore.collection(collectionName).doc(docId).set(data);
  }

  Future<void> addDocWithAutoID(
    String collectionName,
    Map<String, dynamic> data,
  ) async {
    await firestore.collection(collectionName).add(data);
  }

  Future<void> updateDoc(
    String collectionName,
    String docId,
    Map<String, dynamic> data,
  ) async {
    await firestore.collection(collectionName).doc(docId).update(data);
  }

  Future<void> deleteDoc(String collectionName, String docId) async {
    await firestore.collection(collectionName).doc(docId).delete();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCollection(
    String collectionName,
  ) async {
    return await firestore.collection(collectionName).get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getRealTimeCollection(
    String collectionName,
  ) {
    return firestore.collection(collectionName).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getRealTimeDoc(
    String collectionName,
    String docID,
  ) {
    return firestore.collection(collectionName).doc(docID).snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCollectionWhere(
    String collectionName,
    String field,
    String value,
  ) async {
    return await firestore
        .collection(collectionName)
        .where(field, isEqualTo: value)
        .get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getRealTimeCollectionWhere(
    String collectionName,
    String field,
    String value,
  ) {
    return firestore
        .collection(collectionName)
        .where(field, isEqualTo: value)
        .snapshots();
  }
}
