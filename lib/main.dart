import 'package:flutter/material.dart';
import 'package:notes/services/auth/auth_service.dart';
import 'package:notes/views/constants/routes.dart';
import 'package:notes/views/loginview.dart';
import 'package:notes/views/notes_view.dart';
import 'package:notes/views/register.dart';
import 'package:notes/views/verify.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const NotesView(),
      verifyEmailRoute: (context) => const verifyEmailView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            // return const LoginView();
            // ignore: dead_code
            final user = AuthService.firebase().currentUser;
            // devtools.log(user.toString());
            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return const verifyEmailView();
              }
            } else {
              return const LoginView();
            }

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}







// // final ef = user?.emailVerified ?? false;
// // devtools.log(ef);
// if (user?.emailVerified ?? false) {
//   devtools.log('You are a verified user');
// } else {
//   // Future.delayed(
//   //   Duration.zero,
//   //   () {
//   //     Navigator.of(context).push(MaterialPageRoute(
//   //       builder: (context) => const verifyEmailView(),
//   //     ));
//   //   },
//   // );
//   // devtools.log("VERIFICATION DONE");
//   return const verifyEmailView();
// }
// return const Text('Done');