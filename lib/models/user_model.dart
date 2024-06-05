import 'dart:convert';

class UserModel {
  String? uid;
  String name;
  String surname;
  String? description;
  String email;
  String username;
  String birthDay;
  String? profilePhoto;
  UserModel({
    this.uid,
    required this.name,
    required this.surname,
    this.description,
    required this.email,
    required this.username,
    required this.birthDay,
    this.profilePhoto,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? surname,
    String? description,
    String? email,
    String? username,
    String? birthDay,
    String? profilePhoto,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      description: description ?? this.description,
      email: email ?? this.email,
      username: username ?? this.username,
      birthDay: birthDay ?? this.birthDay,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (uid != null) {
      result.addAll({'uid': uid});
    }
    result.addAll({'name': name});
    result.addAll({'surname': surname});
    if (description != null) {
      result.addAll({'description': description});
    }
    result.addAll({'email': email});
    result.addAll({'username': username});
    result.addAll({'birthDay': birthDay});
    if (profilePhoto != null) {
      result.addAll({'profilePhoto': profilePhoto});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      description: map['description'],
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      birthDay: map['birthDay'] ?? '',
      profilePhoto: map['profilePhoto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, surname: $surname, description: $description, email: $email, username: $username, birthDay: $birthDay, profilePhoto: $profilePhoto)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uid == uid &&
        other.name == name &&
        other.surname == surname &&
        other.description == description &&
        other.email == email &&
        other.username == username &&
        other.birthDay == birthDay &&
        other.profilePhoto == profilePhoto;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        description.hashCode ^
        email.hashCode ^
        username.hashCode ^
        birthDay.hashCode ^
        profilePhoto.hashCode;
  }
}
