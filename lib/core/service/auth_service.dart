import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:learn_world/models/models.dart' as md;
import 'package:learn_world/constants/constants.dart';

@immutable
final class AuthService {
  const AuthService(this.auth, this.google, this.preferences);

  final FirebaseAuth auth;
  final GoogleSignIn google;
  final SharedPreferences preferences;

  md.User? get init {
    final userData = preferences.getString(AppKeys.userCacheKey);
    return userData != null ? md.User.fromJson(jsonDecode(userData) as Map<String, dynamic>) : null;
  }

  Future<void> logout() async {
    await auth.signOut();
    await google.signOut();
    await preferences.remove(AppKeys.userCacheKey);
  }

  Future<(md.User?, String?)> signInWithGoogle() async {
    try {
      final googleUser = await google.signIn();
      final googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential = await auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        final user = md.User(
          uid: userCredential.user!.uid,
          email: userCredential.user?.email,
          phoneNumber: userCredential.user?.phoneNumber,
          photoUrl: userCredential.user?.photoURL,
          displayName: userCredential.user?.displayName,
        );
        await preferences.setString(AppKeys.userCacheKey, jsonEncode(user.toJson()));
        return (user, null);
      } else {
        return (null, '401');
      }
    } catch (e) {
      log(e.toString());
      return (null, '401');
    }
  }
}
