// choice_page.dart
import 'package:flutter/material.dart';
import 'package:flutterappkideld/eldlandingpage.dart';
import 'package:flutterappkideld/landing_page.dart';
import 'package:flutterappkideld/profile.dart';

import 'nameandphone.dart';

class ChoicePage extends StatefulWidget {
  @override
  _ChoicePageState createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.repeat(reverse: true); // Repeat animation for a bouncy effect
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to ProfilePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                icon: Icon(Icons.child_care, color: Colors.white),
                label: Text(
                  'Kids',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade400,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.purple.shade800,
                  elevation: 10,

                ),
              ),
            ),
            SizedBox(height: 30),
            ScaleTransition(
              scale: _animation,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to ProfilePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingPage2(assetpath: '',)),
                  );
                },
                icon: Icon(Icons.elderly, color: Colors.white),
                label: Text(
                  'Elder People',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade400,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.teal.shade800,
                  elevation: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
