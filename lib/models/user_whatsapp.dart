part of 'models.dart';

class UserWhatsapp extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final String gender;

  UserWhatsapp(
    this.id,
    this.email, {
    this.gender,
    this.name,
    this.profilePicture,
  });

  UserWhatsapp copyWith({String name, String profilePicture, String gender}) =>
      UserWhatsapp(this.id, this.email,
          gender: gender ?? this.gender,
          name: name ?? this.name,
          profilePicture: profilePicture);

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        gender,
      ];

  @override
  String toString() {
    return "[$id] - $name - $email";
  }
}
