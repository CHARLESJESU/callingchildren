import 'package:flutter/material.dart';
import 'package:flutterappkideld/choice_page.dart';
import 'package:flutterappkideld/nameandphone.dart';
import 'package:flutterappkideld/profile.dart';
import 'package:lottie/lottie.dart'; // Import the Lottie package
import 'landing_page.dart';
import 'authentication.dart';
import 'Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async'; // For using Timer

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds (or the duration of the Lottie animation) before showing the text and button
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _showContent = true; // Show the text and button after the delay
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie animation that plays once
            Lottie.asset(
              'assets/animation/login.json',
              width: 300, // Adjust the size as needed
              height: 200,

              repeat: false, // Disable repeat to play it just once
            ),
         // Spacing between animation and content
            if (_showContent) ...[
              const Text(
                "Congratulations\nYou have successfully Logged in",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              _buildButton(
                onTap: () async {
                  await AuthServicews().signOut();
                  //SharedPreferences prefs = await SharedPreferences.getInstance();
                 // await prefs.setBool('isLoggedIn', true); // Set login status
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ChoicePage()),
                  );
                },
                text: "Go To Next Page",
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: const Text(
            "Back to Login",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({required VoidCallback onTap, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
