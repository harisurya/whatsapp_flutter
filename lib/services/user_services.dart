part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");

  static Future<void> updateUser(UserWhatsapp user) async {
    // String genres = "";

    // for (var genre in user.selectedGenres) {
    //   genres += genre + ((genre != user.selectedGenres.last) ? ',' : '');
    // }
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'gender': user.gender,
      'profilePicture': user.profilePicture ?? ""
    });
  }

  static Future<UserWhatsapp> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return UserWhatsapp(id, snapshot.data()['email'],
        gender: snapshot.data()['gender'],
        profilePicture: snapshot.data()['profilePicture'],
        name: snapshot.data()['name']);
  }

  static Future<List<UserWhatsapp>> getUsers() async {
    List<UserWhatsapp> users = [];
    QuerySnapshot snapshot = await _userCollection.get();

    var documents = snapshot.docs;
    for (var document in documents) {
      users.add(UserWhatsapp(document.id, document.data()['email'],
          gender: document.data()['gender'],
          profilePicture: document.data()['profilePicture'],
          name: document.data()['name']));
    }

    return users;
  }
}
