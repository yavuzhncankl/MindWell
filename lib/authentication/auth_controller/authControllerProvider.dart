import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindwell/authentication/auth_repository/authRepository.dart';
import 'package:mindwell/models/user_model.dart';

final authControllerProvider = Provider((ref) => AuthController(
      authRepository: ref.watch(authRepositoryProvider),
    ));

class AuthController {
  final AuthRepository authRepository;
  AuthController({
    required this.authRepository,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return authRepository.signOut();
  }

  Future<void> storeUserInfoToFirebase(UserModel userModel) async {
    return authRepository.storeUserInfoToFirebase(userModel);
  }
}
