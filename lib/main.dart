import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:firebase_auth/firebase_auth.dart';
import 'sign_in_screen.dart';
import 'diary_screen.dart';
import 'grammar_practice.dart';



// 기존에 알던 main과는 좀 다르다.
void main() async { // async means this function will do something that takes time, so it can pause and wait instead of blocking everything.
  WidgetsFlutterBinding.ensureInitialized(); // this line makes sure everyting is properly prepared, especially before using things like Firebase or Plugins.
  await Firebase.initializeApp(); // Connect your Flutter app to Firebase.

  // I am testing the grammar page so i need to get this code back.
  // runApp(const MyApp()); // This launches your app and shows the UI.
  runApp(const MaterialApp(home: GrammarPracticePage())); // temporarily.

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // show diary
            return const DiaryScreen();
          } else {
            // show sign in
            return const SignInScreen();
          }
        },
      ),
    );
  }
}