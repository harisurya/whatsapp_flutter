part of 'services.dart';

class Authservices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(
      {String email, String password, String name, String gender}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserWhatsapp user =
          UserWhatsapp(result.user.uid, email, name: name, gender: gender);

      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(message: e.message);
    }
  }

  static Future<SignInSignUpResult> signIn(
      {@required String email, @required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserWhatsapp user =
          await UserServices.getUser(id: userCredential.user.uid);

      return SignInSignUpResult(user: user);
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(message: e.message);
    }
  }

  static Future<Void> signOut() async {
    await _auth.signOut();
  }

  static Stream<User> get userStream => _auth.authStateChanges();

  static Future<SignInSignUpResult> updatePassword(
      {String email, String currentPassword, String newPassword}) async {
    User user = _auth.currentUser;
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: currentPassword);

      return await user.reauthenticateWithCredential(credential).then((value) {
        user.updatePassword(newPassword);
        return SignInSignUpResult(message: null);
      });
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(message: e.message.toString());
    }
  }

  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}

class SignInSignUpResult {
  final UserWhatsapp user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
