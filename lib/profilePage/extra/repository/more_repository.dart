// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindwell/models/article_model.dart';
import 'package:mindwell/models/user_model.dart';
import 'package:riverpod/riverpod.dart';

final MoreRepositoryProvider = Provider((ref) => MoreRepository(
    auth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance));

class MoreRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;
  MoreRepository({required this.auth, required this.firebaseFirestore});

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<UserModel> getUser() async {
    final user = await firebaseFirestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .get();
    return UserModel.fromMap(user.data()!);
  }

  Future<void> writeArticle(ArticleModel model) async {
    await firebaseFirestore.collection("articles").add(model.toMap());
    await addSubCollection(
        "users", auth.currentUser!.uid, "articles", model.uid, model.toMap());
  }

  Future<void> addSubCollection(
      String collectionName,
      String docId,
      String subCollectionName,
      subCollectionDocId,
      Map<String, dynamic> data) async {
    await firebaseFirestore
        .collection(collectionName)
        .doc(docId)
        .collection(subCollectionName)
        .doc(subCollectionDocId)
        .set(data);
  }

  Future<void> updateProfile(UserModel model) async {
    await firebaseFirestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .update(
          model.toMap(),
        );
  }
}
