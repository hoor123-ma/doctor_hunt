import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;
  Future<UserCredential> createUserWithEmailAndPassword(
    String emailAddress,
    String password,
  ) async {
    return await auth.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  }

  Future<UserCredential> signInWithEmailandPassword(
    String emailAddress,
    String password,
  ) async {
    return await auth.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  }

  Future<void> initializeGoogleSignIn() async {
    await googleSignIn.initialize();
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return await auth.signInWithCredential(credential);
  }

  Future<void> passwordResetEmail(String emialAddress) async {
    await auth.sendPasswordResetEmail(email: emialAddress);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
