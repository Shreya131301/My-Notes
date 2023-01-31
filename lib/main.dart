import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/firebase_options.dart';
import 'package:notes/views/loginview.dart';
import 'package:notes/views/register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterView()
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return const LoginView();
          // final user = FirebaseAuth.instance.currentUser;
          // // final ef = user?.emailVerified ?? false;
          // // print(ef);
          // if (user?.emailVerified ?? false) {
          //   print('You are a verified user');
          // } else {
          //   // Future.delayed(
          //   //   Duration.zero,
          //   //   () {
          //   //     Navigator.of(context).push(MaterialPageRoute(
          //   //       builder: (context) => const verifyEmailView(),
          //   //     ));
          //   //   },
          //   // );
          //   // print("VERIFICATION DONE");
          //   return const verifyEmailView();
          // }
          // return const Text('Done');

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}


