import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_blog/data/user_data.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthData {
  static final AuthData _instance = AuthData();
  final FirebaseAuth authRef = FirebaseAuth.instance;

  static AuthData instance() {
    return _instance;
  }

  Future<bool> registerAccount(String email, String password) async {
    bool result = false;
    try {
      bool isEmailExisted = await UserData.instance().checkEmailExisted(email);
      if (isEmailExisted == false) {
        await authRef.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
      result = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<UserCredential?> loginWithAccount(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}