import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool emailExists = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> checkEmail() async {
    String email = emailController.text;

    // Check if the email exists in Firestore
    final userQuery = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (userQuery.docs.isNotEmpty) {
      setState(() {
        emailExists = true;
      });
    } else {
      _showErrorDialog("Your email ID does not exist. Go to Sign Up.");
    }
  }

  void resetPassword() async {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text;

      try {
        // Send a password reset email
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        _showSuccessDialog("Password reset email has been sent. Please check your inbox.");
      } catch (e) {
        _showErrorDialog("An error occurred while sending the email.");
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Enter your email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill this field';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: checkEmail,
                child: const Text("Check Email"),
              ),
              const SizedBox(height: 20),
              if (emailExists) ...[
                ElevatedButton(
                  onPressed: resetPassword,
                  child: const Text("Send Reset Email"),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
