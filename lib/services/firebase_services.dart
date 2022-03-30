import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<bool> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      final result = await auth.signInWithCredential(credential);
      if (result.user != null) {
        final response = await addUserToDb(result.user!);
        if (response) {
          return true;
        }
        return false;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  static Future<void> signOutFromGoogle() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }

  Future<bool> addUserToDb(User user) async {
    final existingUser = await db.collection("Users").doc(user.uid).get();
    if (existingUser.data() == null) {
      try {
        await db.collection("Users").doc(user.uid).set({
          "email": user.email,
          "name": user.displayName,
        });
        return true;
      } catch (e) {
        return false;
      }
    }
    return true;
  }
}
