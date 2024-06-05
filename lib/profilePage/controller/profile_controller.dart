import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindwell/models/user_model.dart';
import 'package:mindwell/profilePage/repository/profile_repository.dart';

final ProfileControllerProvider = Provider((ref) => ProfileController(
      profileRepository: ref.read(ProfileRepositoryProvider),
    ));

class ProfileController {
  final ProfileRepository profileRepository;
  ProfileController({
    required this.profileRepository,
  });

  Future<UserModel> getUser() async {
    return await profileRepository.getUser();
  }
}
