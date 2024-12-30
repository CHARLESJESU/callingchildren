import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterappkideld/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Global variables
String globalName = '';
String globalPhone = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'Your_api_key',
        appId: 'Your_api_id',
        messagingSenderId: 'your_messaid',
        projectId: 'your_projectid',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  await loadGlobalVariables();

  runApp(const MyApp());
}

// Load global variables from SharedPreferences
Future<void> loadGlobalVariables() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  globalName = prefs.getString('globalName') ?? '';
  globalPhone = prefs.getString('globalPhone') ?? '';
}

// Save global variables to SharedPreferences
Future<void> saveGlobalVariables(String name, String phone) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('globalName', name);
  await prefs.setString('globalPhone', phone);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Start with the SplashScreen
    );
  }
}
