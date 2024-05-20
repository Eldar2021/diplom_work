import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:learn_world/core/core.dart';
import 'package:learn_world/firebase_options.dart';
import 'package:learn_world/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final pref = await SharedPreferences.getInstance();
  final auth = FirebaseAuth.instance;
  final googleSign = GoogleSignIn(
    scopes: ['email', 'profile'],
    hostedDomain: '',
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthService(auth, googleSign, pref)),
        RepositoryProvider(create: (context) => ApiService()),
        RepositoryProvider(create: (context) => AppService(pref)),
        RepositoryProvider(create: (context) => FetchMdService(pref, RepositoryProvider.of<ApiService>(context))),
      ],
      child: const MyApp(),
    ),
  );
}
