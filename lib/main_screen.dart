// main_screen.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterappkideld/home_screen.dart';
import 'package:flutterappkideld/Login.dart';
import 'package:flutterappkideld/profile.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProfilePage();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
