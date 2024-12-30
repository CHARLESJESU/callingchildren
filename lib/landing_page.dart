import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'call_page.dart';
import 'elderpeoplecallpage.dart'; // Import your CallPage

class LandingPage extends StatefulWidget {
  final String assetpath;
  const LandingPage({super.key,  required this.assetpath});

  @override

  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final TextEditingController callIdController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
       actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white, size: 30),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLoggedIn', false); // Set isLoggedIn to false
              await prefs.setBool('isLandingPageFirstTime', true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),*/
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView( // Add this to enable scrolling
            child: Center(
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Join a Call",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: callIdController,
                          hintText: "Enter Call ID",
                          icon: Icons.call,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: userIdController,
                          hintText: "Enter User ID",
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: userNameController,
                          hintText: "Enter Username",
                          icon: Icons.account_circle,
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if(widget.assetpath==''){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Elderpeoplecallpage(
                                      callID: callIdController.text,
                                      userID: userIdController.text,
                                      username: userNameController.text,

                                    ),
                                  ),
                                );
                              }
                              else{
                              SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                              await prefs.setBool('isLandingPageFirstTime', false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CallPage(
                                    callID: callIdController.text,
                                    userID: userIdController.text,
                                    username: userNameController.text,
                                    assetPath: widget.assetpath,

                                  ),
                                ),
                              );
                            }}
                          },
                          child: const Text(
                            "Join the Call",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill this field';
        }
        return null;
      },
    );
  }
}
