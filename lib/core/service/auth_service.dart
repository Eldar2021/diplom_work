import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:learn_world/models/models.dart' as md;
import 'package:learn_world/constants/constants.dart';

class AuthService {
  const AuthService(FirebaseAuth auth, GoogleSignIn google, SharedPreferences preferences)
      : _auth = auth,
        _google = google,
        _preferences = preferences;

  final FirebaseAuth _auth;
  final GoogleSignIn _google;
  final SharedPreferences _preferences;

  md.User? init() {
    final userData = _preferences.getString(AppKeys.userCacheKey);
    if (userData != null) return md.User.fromJson(jsonDecode(userData) as Map<String, dynamic>);
    return null;
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _google.signOut();
    await _preferences.remove(AppKeys.userCacheKey);
  }

  Future<(md.User?, String?)> signInWithGoogle() async {
    final googleUser = await _google.signIn();

    final googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential = await _auth.signInWithCredential(credential);
    if (userCredential.user != null) {
      final user = md.User(
        uid: userCredential.user!.uid,
        email: userCredential.user?.email,
        phoneNumber: userCredential.user?.phoneNumber,
        photoUrl: userCredential.user?.photoURL,
        displayName: userCredential.user?.displayName,
      );
      await _preferences.setString(AppKeys.userCacheKey, jsonEncode(user.toJson()));
      return (user, null);
    } else {
      return (null, '401');
    }
  }
}
