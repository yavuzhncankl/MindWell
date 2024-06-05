// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindwell/models/user_model.dart';

final ProfileRepositoryProvider = Provider((ref) => ProfileRepository(
      firebaseFirestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
    ));

class ProfileRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;
  ProfileRepository({
    required this.firebaseFirestore,
    required this.auth,
  });

  Future<UserModel> getUser() async {
    return await firebaseFirestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) {
      return UserModel.fromMap(value.data()!);
    });
  }
}
