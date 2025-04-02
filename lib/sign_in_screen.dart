import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//extends: This class is a child of another class. It inherits all the features of the parent class.
class SignInScreen extends StatefulWidget {
  //this line is the constructor of your SignInScreen class.
  const SignInScreen({Key? key}) : super(key: key);

  //override: replacing a method from parent class with my own version.
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

// it shows a screen where users can enter their email and password to sign in or sign up using Firebase Authentication.
class _SignInScreenState extends State<SignInScreen> {
  // These are used to get the text the user types into the email and password fields.
  // TextEditingController() hels you read and control the input
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //This function is called when the user presses Sign In.
  Future<void> signIn() async {
    // try/catch is used to handle errors.
    try {
      // final : this variable can only be set once.
      // credential : user's log in info.
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(), // emailController.text: gives the text typed by the user in the email input box.
        password: passwordController.text.trim(), // trim() : removes extra spaces
      );
      // Successfully signed in. Navigate to your main diary screen.
    } catch (e) {
      // Show error or alert.
      print('Sign in failed: $e');
    }
  }

  // this is for creating a new account.
  Future<void> signUp() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // Successfully signed up. Possibly show a success message or go to diary screen.
    } catch (e) {
      print('Sign up failed: $e');
    }
  }

  // this build the UI.
  @override
  Widget build(BuildContext context) {
    // Scaffold: provides a basic screen layout with an AppBar and body.
    return Scaffold(
      //display the title bar at the top that says "Sign In"
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // child : add One Widget
        child: Column(
          // Children: add Multiple Widgets
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: signIn,
              child: const Text('Sign In'),
            ),
            TextButton(
              onPressed: signUp,
              child: const Text('Create an Account'),
            ),
          ],
        ),
      ),
    );
  }
}