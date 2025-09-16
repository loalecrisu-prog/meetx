import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  Future<GoogleSignInAccount?> signIn() async {
    try {
      final account = await _googleSignIn.signIn();
      return account;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() => _googleSignIn.signOut();

  GoogleSignInAccount? get currentUser => _googleSignIn.currentUser;
}
