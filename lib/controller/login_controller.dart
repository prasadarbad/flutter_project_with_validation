import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/user_details.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController with ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetails? userDetails;

  googleLogin() async {
    googleSignInAccount = await _googleSignIn.signIn();

    userDetails = UserDetails(
      displayName: googleSignInAccount!.displayName,
      email: googleSignInAccount!.email,
      photoURL: googleSignInAccount!.photoUrl,
    );
    notifyListeners();
  }

  logout() async {
    googleSignInAccount = await _googleSignIn.signOut();
    userDetails = null;
    notifyListeners();
  }
}
